//
//  PokemonService.swift
//  OMDB
//
//  Created by Rodrigo on 15/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import Foundation
import Moya

enum PokemonService {
    case pokemon()
}

extension PokemonService: TargetType{
    var baseURL: URL {
        return URL(string: "http://pokeapi.co/api/v2/")!
    }
    
    var path: String {
        switch self {
        case .pokemon():
            return ""
        default:
            <#code#>
        }
    }
    
    var method: Method {
        <#code#>
    }
    
    var sampleData: Data {
        <#code#>
    }
    
    var task: Task {
        <#code#>
    }
    
    var headers: [String : String]? {
        <#code#>
    }
    
    
}
