//
//  Item.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import Foundation

class Item {
    var id: String?
    var author: String?
    var avatarUrl: URL?
    var timeline: String?
    var title: String?
    var body: String?
    var imageUrl: URL?
    var likes: String?
    var shares: String?
    var comments: String?
    
    var type: String?
    var deleted: Bool? {
        return type == "DELETE" ? true : false
    }
    
    init?(data: NSDictionary){
        guard let id = data["id"] as? String else {return nil}
        guard let type = data["type"] as? String else {return nil}
        
        guard let author = data["author"] as? NSDictionary else {return nil}
        guard let displayName = author["displayName"] as? String else {return nil}
        guard let avatar = author["avatarImage"] as? NSDictionary else {return nil}
        guard let avatarUrl = avatar["url"] as? String else {return nil}
        
        guard let payload = data["payload"] as? NSDictionary else {return nil}
        guard let title = payload["plainTitle"] as? String else {return nil}
        guard let body = payload["plainContentPreview"] as? String else {return nil}
        guard let headLineImage = payload["headLineImage"] as? NSDictionary else {return nil}
        guard let imageUrl = headLineImage["url"] as? String else {return nil}
        
        guard let stats = payload["stats"] as? NSDictionary else {return nil}
        guard let reactionStats = stats["reactionStats"] as? NSDictionary else {return nil}
        guard let counts = reactionStats["counts"] as? NSDictionary else {return nil}
        guard let likes = counts["LIKE"] as? Int else {return nil}
        guard let shares = counts["SHARE"] as? Int else {return nil}
        
        guard let commentStats = stats["commentStats"] as? NSDictionary else {return nil}
        guard let comments = commentStats["count"] as? Int else {return nil}
        
        self.id = id
        self.author = displayName
        self.avatarUrl = URL(string: avatarUrl)
        self.title = title
        self.body = body
        self.imageUrl = URL(string: imageUrl)
        self.likes = String(likes)
        self.shares = String(shares)
        self.comments = String(comments)
        self.type = type
        
    }
}
