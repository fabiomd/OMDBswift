//
//  ListPresenterViewController.swift
//  OMDB
//
//  Created by Fábio Moreira on 28/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.

import UIKit
import SwiftOverlays


class ListPresenterViewController: UIViewController  {
    @IBOutlet weak var dateView: UILabel!
    
    let listTopRatedInteractor = ListTopRatedInteractor()
    let listNewMovieInteractor = ListNewMovieInteractor()
    let listSearchInteractor = ListSearchInteractor()
    let dateInteractor = DateInteractor()
    
    var newMovies : Array<MovieEntity> = []
    var topRatedItems : Array<MovieEntity> = []
    var searchResults : Array<MovieEntity> = []
    let cellIdentifier = "topRatedCell"
    @IBOutlet weak var topRatedView: TopRatedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateView.text = dateInteractor.today()
        let taskGroup = DispatchGroup()
        taskGroup.enter()
        self.showWaitOverlay()
        listTopRatedInteractor .getTopRated(page: 1, completion: { (Movies) in
            self.topRatedItems = Movies
            taskGroup.leave()
//            self.topRatedView.reloadData()
        })
        
        taskGroup.enter()
        listNewMovieInteractor .newMovies(page: 1, completion: { (Movies) in
            self.newMovies = Movies
            taskGroup.leave()
//            self.topRatedView.reloadData()
        })
        
        taskGroup.notify(queue: DispatchQueue.main, work: DispatchWorkItem(block: {
            self.removeAllOverlays()
            self.topRatedView.reloadData()
        }))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movedetails"{
            let detailsViewController = segue.destination as! DetailsViewController
            detailsViewController.movie = (sender as! MovieEntity)
            detailsViewController.title = "Detais"
        }
    }
    
}

extension ListPresenterViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (searchResults.count == 0){
            return 2
        }else{
            return 3
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.topRatedView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ListPresenterCollectionViewCell
        cell.cv = self
        if(searchResults.count == 0){
            switch indexPath.row {
            case 0:
                cell.fillCell(movies: self.newMovies, tittle: "In Theaters", subtittle: "TOP " + String(newMovies.count))
            case 1:
                cell.fillCell(movies: self.topRatedItems, tittle: "TopRated", subtittle: "BEST " + String(topRatedItems.count))
            default:
                cell.fillCell(movies: self.topRatedItems, tittle: "In Theaters", subtittle: "teste")
            }
        }else{
            switch indexPath.row {
            case 0:
                cell.fillCell(movies: self.searchResults, tittle: "Search Results", subtittle: "Found " + String(searchResults.count))
            case 1:
                cell.fillCell(movies: self.newMovies, tittle: "In Theaters", subtittle: "TOP " + String(newMovies.count))
            case 2:
                cell.fillCell(movies: self.topRatedItems, tittle: "TopRated", subtittle: "BEST " + String(topRatedItems.count))
            default:
                cell.fillCell(movies: self.topRatedItems, tittle: "In Theaters", subtittle: "teste")
                }
        }
        return cell
    }
}

extension ListPresenterViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.showWaitOverlay()
        if((searchBar.text) != nil){
            listSearchInteractor .getResultFromSearch(text: searchBar.text!,page: 1, completion: { (Movies) in
                self.searchResults = Movies
                self.removeAllOverlays()
                self.topRatedView.reloadData()
            })
        }
    }
}

