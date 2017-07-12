//
//  ItemsFeedViewModelsTests.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import Foundation
import XCTest
import Firebase
@testable import hubrick_firebaseApp

class ItemsFeedViewModelsTests: XCTestCase {
    
    let testHelper = TestHelpers()
    let itemsFeedViewModel = ItemsFeedViewModel()
    
    override func setUp() {
        super.setUp()
    }
    
    
    func testItemsMapping() {
        var items: [Item] = []
        let jsonDict = testHelper.readJson(file: TestHelpers.jsonADDFile)
        if let dict = jsonDict {
            if let item = Item(data: dict){
                items.append(item)
                itemsFeedViewModel.itemsFeed = items
                XCTAssert(itemsFeedViewModel.itemViewModel(forIndex: 0)?.author == item.author)
                XCTAssert(itemsFeedViewModel.itemsCount == 1)
            }
        }
    }

}
