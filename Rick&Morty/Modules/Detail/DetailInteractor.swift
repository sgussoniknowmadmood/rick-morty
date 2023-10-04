//
//  DetailInteractor.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation
import UIKit

class DetailInteractor {
    weak var output: DetailInteractorOutputContract!
    private var detailOutput: DetailOutputContract
        
    init(detailOutput: DetailOutputContract) {
        self.detailOutput = detailOutput
    }
    
}

extension DetailInteractor: DetailInteractorContract {
}

extension DetailInteractor: DetailInputContract {
}
