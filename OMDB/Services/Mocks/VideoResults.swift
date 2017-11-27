//
//  videoResults.swift
//  OMDB
//
//  Created by Fábio Moreira on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit
import Foundation

struct videoResults: Decodable {
    let details: [VideoKey]
    private enum CodingKeys: String, CodingKey {
        case details = "results"
    }
}

struct VideoKey: Decodable {
    let key: String
}
