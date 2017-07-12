//
//  ItemTests.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import Foundation
import XCTest
import Firebase
@testable import hubrick_firebaseApp

class ItemsTests: XCTestCase {
    
    let testHelper = TestHelpers()
    
    override func setUp() {
        super.setUp()
    }
    
    func testItemCreation() {
        let jsonDict = testHelper.readJson(file: TestHelpers.jsonADDFile)
        if let dict = jsonDict {
            if let show = Item(data: dict){
                XCTAssert(show.id == dict["id"] as? String)
                let authorDict = dict["author"] as! NSDictionary
                XCTAssert(show.author == authorDict["displayName"] as? String)
            }
        }
    }
    
    func testItemDeletion() {
        let jsonDict = testHelper.readJson(file: TestHelpers.jsonREMOVEFile)
        if let dict = jsonDict {
            if let show = Item(data: dict){
                XCTAssert(show.deleted == true)
            }
        }
    }
    
    func testItemUpdate() {
        let jsonDict = testHelper.readJson(file: TestHelpers.jsonUPDATEFile)
        if let dict = jsonDict {
            if let show = Item(data: dict){
                XCTAssert(show.id == dict["id"] as? String)
                XCTAssert(show.type == dict["type"] as? String)
            }
        }
    }
    
}
