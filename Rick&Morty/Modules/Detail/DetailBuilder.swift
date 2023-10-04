//
//  DetailBuilder.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation

public class DetailBuilder {

    static func build(detailOutput: DetailOutputContract, completion: @escaping (_ Detailpresenter: DetailPresenterContract) -> Void) {
        
        let view = DetailVC.init(nibName: String(describing: DetailVC.self), bundle: Bundle(for: self))

        let presenter = DetailPresenter()
        let wireframe = DetailWireframe()
        
        let interactor = DetailInteractor(detailOutput: detailOutput)
        
        presenter.interactor = interactor
        presenter.interactor.output = presenter
        presenter.wireframe = wireframe
        
        presenter.wireframe.output = presenter
        
        completion(presenter)
        
    }
}
