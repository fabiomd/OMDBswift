//
//  SubListInteractor.swift
//  OMDB
//
//  Created by Fábio Moreira on 29/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

class SubListInteractor: NSObject {
    
    func fillCell(cell: SubListEntityCollectionViewCell,movie: MovieEntity){
        cell.tittle.text = movie.title
    }
}
