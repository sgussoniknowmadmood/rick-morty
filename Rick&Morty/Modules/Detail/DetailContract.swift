//
//  DetailContract.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation
import UIKit

protocol DetailVcContract {
    var presenter: DetailPresenterContract! { get set }

    func setUpCharacter()
    func setButtonFav()
    func setOffButtonFav()

}

protocol DetailPresenterContract {
    var view: DetailVcContract? { get set }
    var interactor: DetailInteractorContract! { get set }
    var wireframe: DetailWireframeContract! { get set }
    
    func viewWillAppear()
    func viewDidLoad()
    
    func isFav(id: Int) -> Bool
    func setUpFav(id: Int) 
}

protocol DetailInteractorContract {
    var output: DetailInteractorOutputContract! {get set}
}

protocol DetailInteractorOutputContract: AnyObject {
}

protocol DetailWireframeContract {
    var output: DetailWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
}

protocol DetailWireframeOutputContract: AnyObject {

}

public protocol DetailOutputContract {
}

public protocol DetailInputContract {
    
}

