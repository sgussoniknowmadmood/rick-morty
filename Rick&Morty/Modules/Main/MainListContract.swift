//
//  MainListContract.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation
import UIKit

protocol MainListVcContract {
    var presenter: MainListPresenterContract! { get set }

    func updateCollection()
    func showError(alert: UIAlertController)

}

protocol MainListPresenterContract {
    var view: MainListVcContract? { get set }
    var interactor: MainListInteractorContract! { get set }
    var wireframe: MainListWireframeContract! { get set }
    func viewWillAppear()
    func viewDidLoad()
    
    func getFirstChracterPage()
    func getNewCharacterPage()
    func getCharacters() -> [CharacterModel]
    func getCharacter(atIndex: Int) -> CharacterModel?
    func getCharactersCoutn() -> Int
    func characterSelected(atIndex: Int)
    func addfiletrs(filters: [FilterModel])
    func showFav()
}

protocol MainListInteractorContract {
    var output: MainListInteractorOutputContract! {get set}
    
    func getCharacters(firstPage: Bool, filters: [FilterModel])
    func getFavCharacters(favs: [Int])
}

protocol MainListInteractorOutputContract: AnyObject {
    func setCharacters(characters: [CharacterModel]?)
    func showError()
}

protocol MainListWireframeContract {
    var output: MainListWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func goToDetail(character: CharacterModel)
}

protocol MainListWireframeOutputContract: AnyObject {

}

public protocol MainListOutputContract {
}

public protocol MainListInputContract {
    
}
