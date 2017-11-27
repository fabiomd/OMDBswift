//
//  WeatherServicePresenter.swift
//  OMDB
//
//  Created by Rodrigo on 22/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import Foundation
import Moya

protocol WeatherServicePresenterDelegate: class {
    func updateView(presenter: WeatherServicePresenter, updateViewModelWith viewModel:WeatherServicePresenter.ViewModel?)
}

class WeatherServicePresenter {
    weak var delegate: WeatherServicePresenterDelegate?
    var viewModel: WeatherServicePresenter.ViewModel!
    var provider = MoyaProvider<WeatherService>()
    
    func loadData() {
        let teste = WeatherService.weather()
        let weatherService = WeatherService.weather()
        
        provider.request(teste, completion: weatherService.response(completion: { (result) in
            switch result {
            case .success(let weathers):
                guard let weather = weathers as? Weather else {
                    return
                }
                self.viewModel = WeatherServicePresenter.ViewModel(weathers: weather)
				self.delegate?.updateView(presenter: self, updateViewModelWith: self.viewModel)
                break
            case .failure(_):
                break
            }
        }))
    }
}

extension WeatherServicePresenter {
    struct ViewModel {
        var weathers: Weather
    }
}
