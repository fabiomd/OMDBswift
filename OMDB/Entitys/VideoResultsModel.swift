//
//  VideoResultsModel.swift
//  OMDB
//
//  Created by Fábio Moreira on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit
import Foundation

struct videoResultsModel: Decodable {
    let details: [VideoKeyModel]
    private enum CodingKeys: String, CodingKey {
        case details = "results"
    }
}

struct VideoKeyModel: Decodable {
    let key: String
}
