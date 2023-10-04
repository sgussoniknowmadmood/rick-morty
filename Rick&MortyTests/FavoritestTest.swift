//
//  FavoritestTest.swift
//  Rick&MortyTests
//
//  Created by pw-sgussoni on 4/10/23.
//

import XCTest
@testable import Rick_Morty

final class FavoritestTest: XCTestCase {

    func testCleanFav() {
        removeAllFav()
        
        let favs = getFavIds()
        
        if favs.count == 0 {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testSaveFav() {
        removeAllFav()
        
        let testId = 33
        saveIdInFav(id: testId)
        
        if isUserFav(id: testId){
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testSRemoveFav() {
        removeAllFav()
        
        let testId = 33
        saveIdInFav(id: testId)
        removeIdInFav(id: testId)
        
        if !isUserFav(id: testId){
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
}
