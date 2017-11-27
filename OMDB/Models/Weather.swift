//
//  Weather.swift
//  OMDB
//
//  Created by Rodrigo on 15/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import Foundation

struct Weather: Codable{
    var city: String?
    var temp: String?
    var humidity: String?
    var temp_min: String?
    var temp_max: String?
    var country: String?
    var time: String?
}
