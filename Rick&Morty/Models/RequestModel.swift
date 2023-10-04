//
//  RequestModel.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation

struct RequestModel: Codable {
    var info: InfoModel?
    var results: [CharacterModel]?

}

struct InfoModel: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?

}
