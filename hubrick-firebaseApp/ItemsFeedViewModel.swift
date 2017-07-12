//
//  ItemsFeedViewModel.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import Foundation

class ItemsFeedViewModel {
    
    fileprivate var itemsFeedViewModel: [ItemViewModel] = []
    var itemsChanged: (() -> ())?
    var itemsAdded: Bool? = false
    
    var itemsCount: Int {
        return itemsFeedViewModel.count
    }
    
    func itemViewModel(forIndex index: Int) -> ItemViewModel? {
        if index < itemsCount {
            return itemsFeedViewModel[index]
        } else {
            return nil
        }
    }
    
    var itemsFeed = [Item](){
        willSet(newValue){
            if itemsFeed.count == newValue.count || itemsFeed.count == 0 {
                itemsAdded = false
            } else {
                itemsAdded = true
            }
        }
        didSet{
            self.itemsFeedViewModel = self.itemsFeed.map(ItemViewModel.init)
            self.itemsChanged?()
        }
    }
    
    func listenToFirebaseData(){
        let dataProvider = HubrickDataProvider()
        dataProvider.listenToFirebaseData(completitionHandler: {(items) in
            self.itemsFeed = items
        })
    }
    
}
