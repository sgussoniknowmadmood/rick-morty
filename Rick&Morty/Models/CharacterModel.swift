//
//  CharacterModel.swift
//  Rick&Morty
//
//  Created by pw-sgussoni on 2/10/23.
//

import Foundation

enum GenderEnum: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}

enum StatusEnum: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

struct CharacterModel:Codable {
    var id: Int?
    var name: String?
    var status: StatusEnum?
    var species: String?
    var type: String?
    var gender: GenderEnum?
    var origin: CharacterSubModel?
    var location: CharacterSubModel?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
    
    init() {
    }

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

struct CharacterSubModel:Codable {
    var name: String?
    var url: String?

}

/*{
      "id": 361,
      "name": "Toxic Rick",
      "status": "Dead",
      "species": "Humanoid",
      "type": "Rick's Toxic Side",
      "gender": "Male",
      "origin": {
        "name": "Alien Spa",
        "url": "https://rickandmortyapi.com/api/location/64"
      },
      "location": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/20"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/27"
      ],
      "url": "https://rickandmortyapi.com/api/character/361",
      "created": "2018-01-10T18:20:41.703Z"
    }
*/
