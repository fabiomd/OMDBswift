//
//  DetailsViewController.swift
//  OMDB
//
//  Created by Fábio Moreira on 29/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var overviewView: UIView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var image: UIImageView!
    var movie : MovieEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if((movie) != nil){
            self.updateUI()
            self.year.text = movie?.release_date
            self.tittle.text = movie?.original_title
            self.voteAverage.text = NSString(format: "%.1f", (movie?.vote_average)!) as String
            self.overviewTextView.text = movie?.overview
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentedControlWasPressed(_ sender: Any) {
        switch ((sender as!UISegmentedControl).selectedSegmentIndex) {
        case 0:
            overviewView.isHidden = false
        default:
            overviewView.isHidden = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playTrailerWasPressed(_ sender: Any) {
    }
    @IBAction func photoWasPressed(_ sender: Any) {
    }
    private func updateUI(){
        if((movie) != nil){
            let path = "https://image.tmdb.org/t/p/w500" + (movie?.poster_path!)!
            let url = URL(string: path)
            let resource = ImageResource(downloadURL: url!, cacheKey: movie?.title)
            image.kf.setImage(with: resource, placeholder: #imageLiteral(resourceName: "placer"), options: [.transition(.fade(0.3))])
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
