//
//  DetailPresenter.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation

class DetailPresenter: DetailPresenterContract {
    
    var view: DetailVcContract?
    var interactor: DetailInteractorContract!
    var wireframe: DetailWireframeContract!
    
    private var characters: [CharacterModel] = []
 
    func viewDidLoad() {
    
    }
    
    func viewWillAppear() {
    }
    
    func isFav(id: Int) -> Bool{
        return isUserFav(id: id)
    }
    
    func setUpFav(id: Int) {
        if !isUserFav(id: id) {
            saveIdInFav(id: id)
            view?.setButtonFav()
        } else {
            removeIdInFav(id: id)
            view?.setOffButtonFav()
        }
    }
    
}

// MARK: - DetailInteractorOutputContract
extension DetailPresenter: DetailInteractorOutputContract {
}

// MARK: - DetailWireframeOutputContract
extension DetailPresenter: DetailWireframeOutputContract {
    
}

