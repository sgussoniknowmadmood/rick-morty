//
//  MainListInteractor.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation
import UIKit

class MainListInteractor {
    weak var output: MainListInteractorOutputContract!
    
    private var info: InfoModel?
    var currentPage = 1
//    var customUrl = ""

    init(output: MainListInteractorOutputContract) {
        self.output = output
    }
    
    func setInfo(info: InfoModel?) {
        self.info = info
    }
    
    func getCharacters(firstPage: Bool, filters: [FilterModel]) {
        
        let customUrl = getCustomUrl(firstPage: firstPage, filters: filters)
        if !firstPage && info == nil{
            return
        }
        charactersRequest(customUrl: customUrl)
    }
    
    func getFavCharacters(favs: [Int]) {
        
        let customUrl = "/\(favs)"
        charactersRequest(customUrl: customUrl)
    }

        
    private func charactersRequest(customUrl: String) {
        NetworkProvider.getCharacters(customUrl: customUrl) { data in
            self.parseData(data: data)
        }
    }
    
    func parseData(data: Data) {
        let response = try? JSONDecoder().decode(RequestModel.self, from: data)
        let favs = try? JSONDecoder().decode([CharacterModel].self, from: data)
        let singlefav = try? JSONDecoder().decode(CharacterModel.self, from: data)
        self.setInfo(info: response?.info)
        if response != nil {
            self.output.setCharacters(characters: response?.results)
        } else if favs != nil {
            self.output.setCharacters(characters: favs)
        } else if let singlefav = singlefav {
            self.output.setCharacters(characters: [singlefav])
        } else {
            self.output.showError()
        }
    }
    
    func getCustomUrl(firstPage: Bool, filters: [FilterModel]) -> String{
        var customUrl = "/?"
        
        if !firstPage {
            if currentPage < info?.pages ?? 0 {
                currentPage = getPage()
                customUrl += "page=\(currentPage)&"
            }
        }
        
        for filter in filters {
            if let type = filter.type?.rawValue,
               let value = filter.value{
                customUrl += "\(type)=\(value)&"
            }
        }
        
        return customUrl
    }
    
    private func getPage() -> Int {
        let fullNameArr = info?.next?.components(separatedBy: "=")

        let pageSection = fullNameArr?[1]
        if let pageInt = Int( pageSection ?? "1") {
            return pageInt
        } else {
            let pageArray = pageSection?.components(separatedBy: "&")
            return Int(pageArray?.first ?? "1") ?? 1

        }
    }
}

extension MainListInteractor: MainListInteractorContract {
}

extension MainListInteractor: MainListInputContract {
}
