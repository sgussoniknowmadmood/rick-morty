//
//  MainListPresenter.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation
import UIKit

class MainListPresenter: MainListPresenterContract {
    
    var view: MainListVcContract?
    var interactor: MainListInteractorContract!
    var wireframe: MainListWireframeContract!
    private var characters: [CharacterModel] = []
    private var favCharacters: [CharacterModel] = []
    private var filters: [FilterModel] = []

    func viewDidLoad() {
        getFirstChracterPage()
    }
    
    func viewWillAppear() {
    }
    
    func getFirstChracterPage() {
        characters = []
        interactor.getCharacters(firstPage: true, filters: filters)
    }
    
    func getNewCharacterPage() {
        interactor.getCharacters(firstPage: false, filters: filters)
    }
        
    func getCharacters() -> [CharacterModel] {
        return characters
    }
    
    func getCharacter(atIndex: Int) -> CharacterModel? {
        if atIndex > getCharactersCoutn() {
            return characters.first
        }
        return characters[atIndex]
    }
    
    func getCharactersCoutn() -> Int {
        return characters.count
    }
    
    func characterSelected(atIndex: Int) {
        guard let character = getCharacter(atIndex: atIndex) else {return}
        wireframe.goToDetail(character: character)
    }
    
    func addfiletrs(filters: [FilterModel]) {
        self.filters = filters
        getFirstChracterPage()
    }
    
    func showFav() {
        characters = []
        interactor.getFavCharacters(favs: getFavIds())
    }
}

// MARK: - MainListInteractorOutputContract
extension MainListPresenter: MainListInteractorOutputContract {
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            self.view?.showError(alert: alert)
        }
    }
    
    func setCharacters(characters: [CharacterModel]?) {
        guard let characters = characters else {return}
        self.characters.append(contentsOf: characters)
        
        DispatchQueue.main.async {
            self.view?.updateCollection()
        }
    }
}

// MARK: - MainListWireframeOutputContract
extension MainListPresenter: MainListWireframeOutputContract {
    
}
