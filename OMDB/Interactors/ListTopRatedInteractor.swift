//
//  ListTopRatedInteractor.swift
//  OMDB
//
//  Created by Fábio Moreira on 28/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit
import Moya

class ListTopRatedInteractor: NSObject {
    
    func getTopRated(page: Int, completion: @escaping ([MovieEntity])->()){
        let provider = MoyaProvider<MovieService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.topRated(page: page)) { result in
            
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
