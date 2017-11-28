//
//  ResultEntity.swift
//  OMDB
//
//  Created by Fábio Moreira on 28/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

class ResultEntity: Codable {
    let page :Int?,
        total_results : Int?,
        total_pages : Int?,
        results : [MovieEntity]
    
//    private enum CodingKeys: String, CodingKey {
//        case page,
//             total_results,
//             total_pages,
//             results
//    }
}
