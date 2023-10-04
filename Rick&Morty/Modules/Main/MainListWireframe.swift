//
//  MainListWireframe.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation
import UIKit

class MainListWireframe: MainListWireframeContract {
    weak var output: MainListWireframeOutputContract!
    weak var view: UIViewController!
    
    func goToDetail(character: CharacterModel) {
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.character = character
        view.present(detailVC, animated: true)
    }
}
