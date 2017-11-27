//
//  MovieEntity.swift
//  OMDB
//
//  Created by Fábio Moreira on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

class MovieEntity: Decodable {
    let voteCount :Int,
        id : Int,
        video : Bool,
        vote_average : Int,
        title : String,
        popularity : Float,
        poster_path : String,
        original_language : String,
        original_title : String,
        genre_ids : Array<Int>,
        backdrop_path : String,
        adult : Bool,
        overview : String,
        release_date : Date
}
