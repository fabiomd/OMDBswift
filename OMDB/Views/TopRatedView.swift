//
//  TopRatedView.swift
//  OMDB
//
//  Created by Fábio Moreira on 28/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

let cellIdentifier = "subListIdentifier"

class TopRatedView: UICollectionView {
    var subList : Array<MovieEntity> = []
//
//    override func reloadData() {
//        super.reloadData()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return topRatedItems.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = self.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ListEntityCollectionViewCell
//        //        cell.fillCell(movie: topRatedItems[indexPath.row])
//        return cell
//    }
}

//extension TopRatedView : UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return subList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = self.topRatedView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ListEntityCollectionViewCell
//        cell.fillCell(movie: self.subList[indexPath.row], tittle: "In Theaters", subtittle: "teste")
//        return cell
//    }
//}

