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
    
    private var presenter: WeatherServicePresenter = WeatherServicePresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter.delegate = self
		presenter.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ChooseCityViewController: WeatherServicePresenterDelegate {
    func updateView(presenter: WeatherServicePresenter, updateViewModelWith viewModel: WeatherServicePresenter.ViewModel?) {
//        cityLabel.text = weathers?.city
    }
}

