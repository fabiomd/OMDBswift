//
//  MovieModel.swift
//  OMDB
//
//  Created by Fábio Moreira on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

struct MovieModel: Decodable  {
    let id:Int
    let poster_path: String
    var videoPath: String
    let backdrop_path: String
    let title: String
    var release_date: String
    var vote_average: Double
    let overview: String
}
