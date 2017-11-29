//
//  ListPresenterCollectionViewCell.swift
//  OMDB
//
//  Created by Fábio Moreira on 28/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

class ListPresenterCollectionViewCell: UICollectionViewCell {
    
    var subList : Array<MovieEntity> = []
    let cellIdentifier = "subListIdentifier"
//    var cell : ListEntityCollectionViewCell
    
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var subtittle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func fillCell(movies: Array<MovieEntity>, tittle: String, subtittle : String){
        self.tittle.text = tittle
        self.subtittle.text = subtittle
        self.subList = movies
        self.collectionView.reloadData()
    }
}

extension ListPresenterCollectionViewCell : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SubListPresenterCollectionViewCell
        cell.fillCell(movie: self.subList[indexPath.row])
        return cell
    }
}
