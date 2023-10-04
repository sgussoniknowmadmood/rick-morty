//
//  Constant.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation

let baseUrl = "https://rickandmortyapi.com/api"
let characterUrl = "/character"

let userDefaults = UserDefaults.standard
let favKey = "favKey"

private var favoritesId: [Int] = (userDefaults.array(forKey: favKey)) as? [Int] ?? []

func saveIdInFav(id: Int) {
    favoritesId.append(id)
    userDefaults.setValue(favoritesId, forKey: favKey)
}

func removeIdInFav(id: Int) {
    guard let itemIndex = favoritesId.firstIndex(of: id) else { return }
    favoritesId.remove(at: itemIndex)
    userDefaults.setValue(favoritesId, forKey: favKey)
}

func removeAllFav() {
    favoritesId.removeAll()
    userDefaults.setValue(favoritesId, forKey: favKey)
}

func isUserFav(id: Int) -> Bool{
 
    return favoritesId.contains(id)
}

func getFavIds() -> [Int] {
    
    return favoritesId
}
