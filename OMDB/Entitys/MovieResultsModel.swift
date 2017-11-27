//
//  MovieResultsModel.swift
//  OMDB
//
//  Created by Fábio Moreira on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

import UIKit

struct MovieResults: Decodable  {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [MovieModel]
}
