//
//  ListNewMovieInteractor.swift
//  OMDB
//
//  Created by Fábio Moreira on 30/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit
import Moya

class ListNewMovieInteractor: NSObject {
    
    func newMovies(page: Int, completion: @escaping ([MovieEntity])->()){
        let provider = MoyaProvider<MovieService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.newMovies(page: page)) { result in
            
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(ResultEntity.self, from: response.data)
                    completion(results.results)
                }catch let err{
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
