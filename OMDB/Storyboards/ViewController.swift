////
////  ViewController.swift
////  OMDB
////
////  Created by Rodrigo on 03/10/17.
////  Copyright © 2017 Rodrigo. All rights reserved.
////
//
//import UIKit
//import Moya
//
//enum MovieRequest{
//    case recomendation(id:Int)
//    case topRated(page:Int)
//    case newMovies(page:Int)
//    case video(id:Int)
//}
//
//extension MovieRequest: TargetType{
//    static let apiKey = "625a7cbd9e0ae06da951620f6f0015d1"
//
//    var baseURL: URL {
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else { fatalError("baseURL could not be configured") }
//        return url
//    }
//
//    var path: String {
//        switch self {
//            case .recomendation(let id):
//                return "\(id)/recommendations"
//            case .topRated:
//                return "popular"
//            case .newMovies:
//                return "now_playing"
//            case .video(let id):
//                return "\(id)/videos"
//        }
//    }
//
//    var method: Moya.Method {
//        switch self {
//        case .recomendation,
//             .topRated,
//             .newMovies,
//             .video:
//                return .get
//        }
//
//    }
//
//    var sampleData: Data {
//        switch self {
//        case .recomendation,
//             .topRated,
//             .newMovies,
//             .video:
//            guard let path = Bundle.main.path(forResource: "movies", ofType: "json") else { fatalError("path could not be found") }
//            return (try! Data(contentsOf: URL(fileURLWithPath: path)))
//        }
//    }
//
//    var task: Task {
//        switch self {
//        case .recomendation,
//             .topRated,
//             .newMovies,
//             .video:
//                return .requestPlain
//        }
//    }
//
//    var headers: [String : String]? {
//        return nil
//    }
//
//    var parameters: [String : Any]? {
//        switch self {
//        case .recomendation,
//             .video:
//                return ["api_key": API.apiKey]
//        case .topRated(let page),
//             .newMovies(let page):
//                return ["page": page, "api_key": API.apiKey]
//        }
//    }
//
//    var parameterEncoding: ParameterEncoding {
//        switch self {
//        case .recomendation,
//             .topRated,
//             .newMovies,
//             .video:
//                return URLEncoding.queryString
//        }
//    }
//}

