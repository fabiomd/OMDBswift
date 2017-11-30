//
//  SubListPresenterCollectionViewCell.swift
//  OMDB
//
//  Created by Fábio Moreira on 28/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher


class SubListPresenterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var image: UIImageView!
    var movie : MovieEntity?

    
    func updateUI(movie : MovieEntity){
        self.movie = movie
        let path = "https://image.tmdb.org/t/p/w500" + movie.poster_path!
        let url = URL(string: path)
        let resource = ImageResource(downloadURL: url!, cacheKey: movie.title)
        image.kf.setImage(with: resource, placeholder: #imageLiteral(resourceName: "placer"), options: [.transition(.fade(0.3))])
    }
    
    func fillCell(movie: MovieEntity){
        self.tittle.text = movie.title
        self.updateUI(movie: movie)
    }
}
