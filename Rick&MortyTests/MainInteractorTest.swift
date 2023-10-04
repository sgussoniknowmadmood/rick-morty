//
//  MainInteractorTest.swift
//  Rick&MortyTests
//
//  Created by pw-sgussoni on 4/10/23.
//

import XCTest
@testable import Rick_Morty

final class MainInteractorTest: XCTestCase, MainListInteractorOutputContract {

    var mainListInteractor: MainListInteractor!
    var jsonData: Data?
    
    var responseData = """
{
  "info": {
    "count": 826,
    "pages": 42,
    "next": "https://rickandmortyapi.com/api/character?page=2",
    "prev": null
  },
  "results": [
    {
      "id": 1,
      "name": "Rick Sanchez",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {
        "name": "Earth (C-137)",
        "url": "https://rickandmortyapi.com/api/location/1"
      },
      "location": {
        "name": "Citadel of Ricks",
        "url": "https://rickandmortyapi.com/api/location/3"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
      ],
      "url": "https://rickandmortyapi.com/api/character/1",
      "created": "2017-11-04T18:48:46.250Z"
    }
    ]
}
"""
    var responseFavData = """
  [
    {
      "id": 1,
      "name": "Rick Sanchez",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {
        "name": "Earth (C-137)",
        "url": "https://rickandmortyapi.com/api/location/1"
      },
      "location": {
        "name": "Citadel of Ricks",
        "url": "https://rickandmortyapi.com/api/location/3"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
      ],
      "url": "https://rickandmortyapi.com/api/character/1",
      "created": "2017-11-04T18:48:46.250Z"
    }
    ]
"""
    
    var responseSingleFavData = """
  
    {
      "id": 1,
      "name": "Rick Sanchez",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {
        "name": "Earth (C-137)",
        "url": "https://rickandmortyapi.com/api/location/1"
      },
      "location": {
        "name": "Citadel of Ricks",
        "url": "https://rickandmortyapi.com/api/location/3"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
      ],
      "url": "https://rickandmortyapi.com/api/character/1",
      "created": "2017-11-04T18:48:46.250Z"
    }
    
"""
    
    override func setUpWithError() throws {
        mainListInteractor = MainListInteractor(output: self)

    }
    
    func testParseResponse() {
        let data = Data(responseData.utf8)
        mainListInteractor.parseData(data: data)
    }
    
    func testParseFavResponse() {
        let data = Data(responseFavData.utf8)
        mainListInteractor.parseData(data: data)
    }
    
    func testParseSingleFavResponse() {
        let data = Data(responseSingleFavData.utf8)
        mainListInteractor.parseData(data: data)
    }

    func showError() {
        XCTAssert(false)
    }
    
    func setCharacters(characters: [CharacterModel]?) {
        XCTAssert(true)
    }
    
    
    func testGetSimpleUrl() {
        let customUrl = mainListInteractor.getCustomUrl(firstPage: true, filters: [])
        if customUrl == "/?" {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testGetPageUrl() {
        let info = InfoModel(count: 464, pages: 3838, next: "https://rickandmortyapi.com/api/character?page=2", prev: nil)
        mainListInteractor.setInfo(info: info)
        let customUrl = mainListInteractor.getCustomUrl(firstPage: false, filters: [])
        if customUrl == "/?page=2&" {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }

    func testGetFilterUrl() {
        let filters = [FilterModel(type: .name, value: "rick")]
        let customUrl = mainListInteractor.getCustomUrl(firstPage: true, filters: filters)
        if customUrl == "/?name=rick&" {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }

    func testGetFilterPageUrl() {
        let filters = [FilterModel(type: .name, value: "rick")]
        let info = InfoModel(count: 464, pages: 3838, next: "https://rickandmortyapi.com/api/character/?page=2&gender=Male&status=Alive", prev: nil)
        mainListInteractor.setInfo(info: info)
        let customUrl = mainListInteractor.getCustomUrl(firstPage: false, filters: filters)
        if customUrl == "/?page=2&name=rick&" {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
}
