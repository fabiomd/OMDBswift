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
    
    @IBOutlet weak var searchBar: UISearchBar!
    let listTopRatedInteractor = ListTopRatedInteractor()
    let listNewMovieInteractor = ListNewMovieInteractor()
    let listSearchInteractor = ListSearchInteractor()
    let dateInteractor = DateInteractor()
    var currentMoviePage = 1
    var currentTopRatedPage = 1
    var currentSearchResultsPage = 1
    
    var newMovies : Array<MovieEntity> = []
    var topRatedItems : Array<MovieEntity> = []
    var searchResults : Array<MovieEntity> = []
    let cellIdentifier = "topRatedCell"
    @IBOutlet weak var topRatedView: TopRatedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.searchBar.addGestureRecognizer(tap)
        self.dateView.text = dateInteractor.today()
        let taskGroup = DispatchGroup()
        taskGroup.enter()
        self.showWaitOverlay()
        listTopRatedInteractor .getTopRated(page: currentTopRatedPage, completion: { (Movies) in
            self.topRatedItems = Movies
            taskGroup.leave()
//            self.topRatedView.reloadData()
        })
        
        taskGroup.enter()
        listNewMovieInteractor .newMovies(page: currentMoviePage, completion: { (Movies) in
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
                cell.fillCell(movies: self.newMovies, tittle: "In Theaters", subtittle: "TOP " + String(newMovies.count),cellID:  "In Theaters")
            case 1:
                cell.fillCell(movies: self.topRatedItems, tittle: "TopRated", subtittle: "BEST " + String(topRatedItems.count),cellID:  "TopRated")
            default:
                cell.fillCell(movies: self.topRatedItems, tittle: "In Theaters", subtittle: "teste",cellID:  "In Theaters")
            }
        }else{
            switch indexPath.row {
            case 0:
                cell.fillCell(movies: self.searchResults, tittle: "Search Results", subtittle: "Found " + String(searchResults.count),cellID:  "Search Results")
            case 1:
                cell.fillCell(movies: self.newMovies, tittle: "In Theaters", subtittle: "TOP " + String(newMovies.count),cellID:  "In Theaters")
            case 2:
                cell.fillCell(movies: self.topRatedItems, tittle: "TopRated", subtittle: "BEST " + String(topRatedItems.count),cellID:  "TopRated")
            default:
                cell.fillCell(movies: self.topRatedItems, tittle: "In Theaters", subtittle: "teste",cellID:  "In Theaters")
                }
        }
        return cell
    }
}

extension ListPresenterViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.showWaitOverlay()
        self.currentSearchResultsPage = 1
        if((searchBar.text) != nil && (searchBar.text) != ""){
            listSearchInteractor .getResultFromSearch(text: searchBar.text!,page: currentSearchResultsPage, completion: { (Movies) in
                self.searchResults = Movies
                self.removeAllOverlays()
                self.topRatedView.reloadData()
            })
        }else{
            self.searchResults = []
            self.removeAllOverlays()
            self.topRatedView.reloadData()
        }
    }
    
    func dismissKeyboard() {
        self.searchBar.endEditing(true)
    }

}

extension ListPresenterViewController {
    func getMoreElements (cellID : String){
        switch cellID {
        case "Search Results":
            self.getMoreTopResults()
        case "TopRated":
            self.getMoreTopRated()
        case "In Theaters":
            self.getMoreMovies()
        default:
            return
        }
    }
    private func getMoreMovies(){
        currentMoviePage += 1
        self.showWaitOverlay()
        listNewMovieInteractor .newMovies(page: currentMoviePage, completion: { (Movies) in
            if(Movies.count > 0){
                self.newMovies = self.newMovies + Movies
                self.topRatedView.reloadData()
            }
            self.removeAllOverlays()
            //            self.topRatedView.reloadData()
        })
    }
    
    private func getMoreTopRated(){
        currentTopRatedPage += 1
        self.showWaitOverlay()
        listTopRatedInteractor .getTopRated(page: currentTopRatedPage, completion: { (Movies) in
            if(Movies.count > 0){
                self.topRatedItems = self.topRatedItems + Movies
                self.topRatedView.reloadData()
            }
            self.removeAllOverlays()
        })
    }
    
    private func getMoreTopResults(){
        currentSearchResultsPage += 1
        self.showWaitOverlay()
        listSearchInteractor .getResultFromSearch(text: self.searchBar.text!,page: currentSearchResultsPage, completion: { (Movies) in
            if(Movies.count > 0){
                self.searchResults = self.searchResults + Movies
                self.topRatedView.reloadData()
            }
            self.removeAllOverlays()
        })
    }
}
