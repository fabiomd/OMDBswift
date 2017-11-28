//
//  ListPresenterViewController.swift
//  OMDB
//
//  Created by Fábio Moreira on 28/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

class ListPresenterViewController: UIViewController {

//    var topics : Array<MovieEntity> = []
    let listTopRatedInteractor = ListTopRatedInteractor()
    
    @IBOutlet weak var topRatedView: TopRatedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTopRatedInteractor .getTopRated(page: 1, completion: { (Movies) in
            self.topRatedView.topRatedItems = Movies
            self.topRatedView.reloadData()
//            self.topics = Movies
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
