//
//  MovieEntity.swift
//  OMDB
//
//  Created by Fábio Moreira on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit
import Kingfisher

class MovieEntity: Codable {
    let vote_count :Int?,
        id : Int?,
        video : Bool?,
        vote_average : Float?,
        title : String?,
        popularity : Float?,
        poster_path : String?,
        original_language : String?,
        original_title : String?,
        genre_ids : Array<Int>?,
        backdrop_path : String?,
        adult : Bool?,
        overview : String?,
        release_date : String?
    
//    func downloadImage(){
//        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(String(describing: self.poster_path))")  else { return }
//        ImageDownloader.default.downloadImage(with: url, options: [], progressBlock: nil) {
//            (image, error, url, data) in
//            return image
//        }
//    }
}

