//
//  HubrickDataProvider.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import Foundation
import FirebaseDatabase

class HubrickDataProvider: DataProvider {
    
    lazy var ref = Database.database().reference()
    var items = [Item]()
    
    lazy var urlSession: URLSession = {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    
    func listenToFirebaseData(completitionHandler: @escaping ([Item]) -> Void) {
        _ = self.ref.observe(DataEventType.childAdded, with: { (snapshot) in
            if let postDict = snapshot.value as? NSDictionary {
                guard let item = Item(data: postDict) else {print("could not create item"); return}
                self.items.insert(item, at: 0)
                completitionHandler(self.items)
            }
        })
        
        _ = self.ref.observe(DataEventType.childRemoved, with: { (snapshot) in
            if let postDict = snapshot.value as? NSDictionary {
                guard let item = Item(data: postDict) else {print("could not create item"); return}
                _ = self.items.filter{ $0.id == item.id }.first
                completitionHandler(self.items)
            }
        })
        _ = self.ref.observe(DataEventType.childChanged, with: { (snapshot) in
            if let postDict = snapshot.value as? NSDictionary {
                guard let item = Item(data: postDict) else {print("could not create item"); return}
                _ = self.items.filter{ $0.id == item.id }.first
                completitionHandler(self.items)
            }
        })
    }
    
}
