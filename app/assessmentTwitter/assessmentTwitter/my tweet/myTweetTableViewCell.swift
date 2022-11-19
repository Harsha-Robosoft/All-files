//
//  myTweetTableViewCell.swift
//  assessmentTwitter
//
//  Created by Harsha R Mundaragi on 14/10/22.
//

import UIKit

class myTweetTableViewCell: UITableViewCell {

    @IBOutlet weak var dpImage: UIImageView!
    @IBOutlet weak var userNamew: UILabel!
    @IBOutlet weak var hastahe: UILabel!
    @IBOutlet weak var post: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var myLikeButton: UIButton!
    
    func setMyData(data : Tweet)
    {
        self.dpImage.image = data.logo
        self.name.text = data.name
        self.userNamew.text = data.userName
        self.hastahe.text = data.hashtag
        self.post.image = data.post
    }
    
    @IBAction func myLike(_ sender: Any) {
        if (myLikeButton.imageView?.image == #imageLiteral(resourceName: "icon_like_large"))
        {
            myLikeButton.setImage(#imageLiteral(resourceName: "icon_liked_small"), for: UIControl.State.normal)
        }
        else
        {
            myLikeButton.setImage(#imageLiteral(resourceName: "icon_like_large"), for: UIControl.State.normal)
        }
    }
    
}
