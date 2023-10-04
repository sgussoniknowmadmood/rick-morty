//
//  MainListBuilder.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation

public class MainListBuilder {

    static func build(mainListOutput: MainListOutputContract, completion: @escaping (_ mainListpresenter: MainListPresenterContract) -> Void) {
        

        let presenter = MainListPresenter()
        let wireframe = MainListWireframe()
        
        let interactor = MainListInteractor(output: presenter)
        
        presenter.interactor = interactor
        presenter.interactor.output = presenter
        presenter.wireframe = wireframe
        
        presenter.wireframe.output = presenter
        
        completion(presenter)
        
    }
    
}
