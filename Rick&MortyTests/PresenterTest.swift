//
//  PresenterTest.swift
//  Rick&MortyTests
//
//  Created by pw-sgussoni on 4/10/23.
//

import XCTest
@testable import Rick_Morty

final class PresenterTest: XCTestCase {
    
    var mainPresenter: MainListPresenter!

    override func setUpWithError() throws {
        mainPresenter = MainListPresenter()

    }
    
    func testEmptyCharacterCount() {
        mainPresenter.setCharacters(characters: [])
        
        if mainPresenter.getCharactersCoutn() == 0 {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testCharacterCount() {
        let characters = [CharacterModel(), CharacterModel(), CharacterModel()]
        mainPresenter.setCharacters(characters: characters)
        
        if mainPresenter.getCharactersCoutn() == 3 {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testCharacterTest() {
        let testId = 33

        let characters = [CharacterModel(id: testId, name: "Test"), CharacterModel(), CharacterModel()]
        mainPresenter.setCharacters(characters: characters)
        
        let newCharracter = mainPresenter.getCharacter(atIndex: 0)
        if newCharracter?.id == testId {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
}
