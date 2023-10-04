//
//  FilterModel.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 3/10/23.
//

import Foundation

enum FilterEnum: String, Codable {
    case name = "name"
    case status = "status"
    case species = "species"
    case type = "type"
    case gender = "gender"
}

struct FilterModel: Codable {
    var type: FilterEnum?
    var value: String?

    init(type: FilterEnum, value: String) {
        self.type = type
        self.value = value
    }
}
