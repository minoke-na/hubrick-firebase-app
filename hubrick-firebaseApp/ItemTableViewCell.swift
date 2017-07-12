//
//  ItemTableViewCell.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    static let cellIdentifier = "feedItem"
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var timeline: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!

    @IBOutlet weak var likesImage: UILabel!
    @IBOutlet weak var likes: UILabel!
    
    @IBOutlet weak var commentsImage: UILabel!
    @IBOutlet weak var comments: UILabel!
    
    @IBOutlet weak var sharesImage: UIStackView!
    @IBOutlet weak var shares: UILabel!
    
    @IBOutlet weak var itemView: UIView!
    
    var viewModel: ItemViewModel? {
        didSet {
            author.text = viewModel?.author
            title.text = viewModel?.title
            body.text = viewModel?.body
            likes.text = viewModel?.likes
            shares.text = viewModel?.shares
            comments.text = viewModel?.comments
            if viewModel?.deleted == true {
                greyOut()
            }
            //self.avatar.image = self.viewModel?.avatarImage
            //self.imageItem.image = self.viewModel?.imageItem
        }
    }
    
    func greyOut(){
        let grayScale = 0.3
        author.alpha = CGFloat(grayScale)
        title.alpha = CGFloat(grayScale)
        body.alpha = CGFloat(grayScale)
        shares.alpha = CGFloat(grayScale)
        likes.alpha = CGFloat(grayScale)
        comments.alpha = CGFloat(grayScale)
        avatar.alpha = CGFloat(grayScale)
        imageItem.alpha = CGFloat(grayScale)
        likesImage.alpha = CGFloat(grayScale)
        commentsImage.alpha = CGFloat(grayScale)
        sharesImage.alpha = CGFloat(grayScale)
    }
    
}
