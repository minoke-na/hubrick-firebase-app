//
//  ItemViewModel.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import UIKit

class ItemViewModel {
    
    fileprivate let item: Item
    let queue = DispatchQueue(label: "imageQueue")
    
    init(item: Item) {
        self.item = item
    }
    
    var author: String {
        if let author = item.author {
            return author
        } else {
            return ""
        }
    }
    
    var title: String {
        if let title = item.title {
            return title
        } else {
            return ""
        }
    }
    
    var body: String {
        if let body = item.body {
            return body
        } else {
            return ""
        }
    }
    
    var avatarImage: UIImage {
        var image = UIImage()
        if let imageData = NSData(contentsOf: self.avatarUrl) {
            image = UIImage(data: imageData as Data)!
        }
        return image
    }
    
    var imageItem: UIImage {
        var image = UIImage()
        if let imageData = NSData(contentsOf: self.imageUrl) {
            image = UIImage(data: imageData as Data)!
        }
        return image
    }
    
    var avatarUrl: URL {
        if let avatarUrl = item.avatarUrl {
            return avatarUrl
        } else {
            return URL(string: "")!
        }
    }
    
    var imageUrl: URL {
        if let imageUrl = item.imageUrl {
            return imageUrl
        } else {
            return URL(string: "")!
        }
    }
    
    var likes: String {
        if let likes = item.likes {
            return likes
        } else {
            return ""
        }
    }
    
    var shares: String {
        if let shares = item.shares {
            return shares
        } else {
            return ""
        }
    }
    
    var comments: String {
        if let comments = item.comments {
            return comments
        } else {
            return ""
        }
    }
    
    var deleted: Bool {
        if let deleted = item.deleted {
            return deleted
        } else {
            return false
        }
    }

}
