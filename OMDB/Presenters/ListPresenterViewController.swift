//
//  ListPresenterViewController.swift
//  OMDB
//
//  Created by Fábio Moreira on 28/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//qwsdqwdqwdqw

import UIKit


class ListPresenterViewController: UIViewController  {

    let listTopRatedInteractor = ListTopRatedInteractor()
    var topRatedItems : Array<MovieEntity> = []
    let cellIdentifier = "topRatedCell"
    @IBOutlet weak var topRatedView: TopRatedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTopRatedInteractor .getTopRated(page: 1, completion: { (Movies) in
            self.topRatedItems = Movies
            self.topRatedView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ListPresenterViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topRatedItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.topRatedView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ListPresenterCollectionViewCell
        cell.fillCell(movies: self.topRatedItems, tittle: "In Theaters", subtittle: "teste")
        return cell
    }
}

