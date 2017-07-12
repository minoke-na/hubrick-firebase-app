//
//  TestHelpers.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import Foundation

class TestHelpers {
    
    static let jsonADDFile = "feed-item"
    static let jsonREMOVEFile = "feed-item-2"
    static let jsonUPDATEFile = "feed-item-3"
    
    // MARK: Helper
    func readJson(file: String) -> NSDictionary? {
        do {
            if let file = Bundle.main.url(forResource: file, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    return object as NSDictionary
                } else {
                    print("JSON is invalid")
                    return nil
                }
            } else {
                print("no file")
                return nil
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
