//
//  ListEntityCollectionViewCell.swift
//  OMDB
//
//  Created by Fábio Moreira on 28/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

class ListEntityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var subtittle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func fillCell(movie: MovieEntity, tittle: String, subtittle : String){
        self.tittle.text = tittle
        self.subtittle.text = subtittle
    }
}
