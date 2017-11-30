//
//  ListInteractor.swift
//  OMDB
//
//  Created by Fábio Moreira on 29/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

class ListInteractor: NSObject {
    
    func fillCell(cell: ListEntityCollectionViewCell tittle: String, subtittle : String){
        cell.tittle.text = tittle
        cell.subtittle.text = subtittle
    }
}
