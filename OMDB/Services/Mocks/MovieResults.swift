//
//  movie.swift
//  OMDB
//
//  Created by Fábio Moreira on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

struct MovieResults: Decodable  {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case page,
        totalResults = "total_results",
        totalPages = "total_pages",
        movies  = "results"
    }
}

