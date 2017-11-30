//
//  TheaterPresenterCollectionViewCell.swift
//  OMDB
//
//  Created by Fábio Moreira on 29/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

class TheaterPresenterCollectionViewCell: UICollectionViewCell {
    
    let cellIdentifier = "sublist"
    
    @IBOutlet weak var collectionView: UICollectionView!
}

extension TheaterPresenterCollectionViewCell  : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
//        cell.fillCell(movies: self.topRatedItems, tittle: "In Theaters", subtittle: "teste")
        return cell
    }
}
