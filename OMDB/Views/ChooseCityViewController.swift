//
//  ChooseCityViewController.swift
//  OMDB
//
//  Created by Rodrigo on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit


class ChooseCityViewController: UIViewController {
    
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var presenter: WeatherServicePresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          presenter = WeatherServicePresenter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ChooseCityViewController: WeatherServicePresenterDelegate {
    func updateView(presenter: WeatherServicePresenter) {
        //
    }
    
    func WeatherServicePresenter(presenter: WeatherServicePresenter, didUpdateViewModelWith viewModel: WeatherServicePresenter.ViewModel?) {
        
    }
    
    func WeatherServicePresenter(presenter: WeatherServicePresenter, didReceive weathers: Weather?) {
        
        cityLabel.text = weathers?.city
        
    }
}

