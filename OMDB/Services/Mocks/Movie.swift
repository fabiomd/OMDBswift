//
//  movie.swift
//  OMDB
//
//  Created by Fábio Moreira on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

struct Movie: Decodable  {
    let id:Int!
    let posterPath: String
    var videoPath: String?
    let backdrop: String
    let title: String
    var releaseDate: String
    var rating: Double
    let overview: String
    
    private enum CodingKeys: String, CodingKey {
        case id,
        posterPath = "poster_path",
        videoPath,
        backdrop = "backdrop_path",
        title,
        releaseDate = "release_date",
        rating = "vote_average",
        overview
    }
}


