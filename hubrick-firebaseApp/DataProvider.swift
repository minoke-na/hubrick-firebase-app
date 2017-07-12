//
//  DataProvider.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import Foundation

protocol DataProvider {
    
    var urlSession: URLSession { get }
    
    func listenToFirebaseData(completitionHandler: @escaping ([Item]) -> Void)
    
}

extension DataProvider {
    
    func requestData(url: URL, completitionHandler: @escaping (Any) -> Void ) {
        let dataTask = urlSession.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let downloadedData = data else {return}
                do{
                    let json = try JSONSerialization.jsonObject(with: downloadedData, options: [])
                    completitionHandler(json)
                }catch{
                    print("\(error), \(error.localizedDescription)")
                }
            }else {
                print("\(String(describing: error)), \(String(describing: error?.localizedDescription))")
            }
        }
        dataTask.resume()
    }
}
