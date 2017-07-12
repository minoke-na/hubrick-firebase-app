//
//  hubrick_firebaseAppTests.swift
//  hubrick-firebaseAppTests
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import Foundation
import XCTest
import Firebase
@testable import hubrick_firebaseApp

class MainViewControllerTests: XCTestCase {
    
    let testHelper = TestHelpers()
    let itemsFeedViewModel = ItemsFeedViewModel()
    var controller: MainViewController!
    
    override func setUp() {
        super.setUp()
        setupMainViewController()
    }
    
    func testTableViewPopulation() {
        setViewModelData()
        controller.itemsFeedViewModel = self.itemsFeedViewModel
        controller.tableView.reloadData()
        XCTAssert(controller.tableView.numberOfRows(inSection: 0) == 1)
    }
    
    
    // MARK: Helper func
    func setViewModelData() {
        var items: [Item] = []
        let jsonDict = testHelper.readJson(file: TestHelpers.jsonADDFile)
        if let dict = jsonDict {
            if let item = Item(data: dict){
                items.append(item)
                itemsFeedViewModel.itemsFeed = items
            }
        }
    }
    
    func setupMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        controller = storyboard.instantiateInitialViewController() as! MainViewController
        
        UIApplication.shared.keyWindow!.rootViewController = controller
        let _ = controller.view
    }
    
}
