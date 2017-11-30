//
//  SearchService.swift
//  OMDB
//
//  Created by Fábio Moreira on 30/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit
import Moya

enum SearchService{
    case search(text: String, page: Int)
}

extension SearchService: TargetType{
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/") else { fatalError("baseURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "movie"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
        
    }
    
    var sampleData: Data {
        switch self {
        case .search:
            guard let path = Bundle.main.path(forResource: "movies", ofType: "json") else { fatalError("path could not be found") }
            return (try! Data(contentsOf: URL(fileURLWithPath: path)))
        }
    }
    
    var task: Task {
        switch self {
        case .search:
            //            return .requestPlain
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .search(let text, let page):
            return [
                "page": page,
                "query" : text,
                "api_key": APIEntity.apiKey
            ]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .search:
            return URLEncoding.queryString
        }
    }
}

