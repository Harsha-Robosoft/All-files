//
//  TableViewCell.swift
//  assessmentTwitter
//
//  Created by Harsha R Mundaragi on 12/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var hashTag: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    func setData(post : Tweet)
    {
        self.dp.image = post.logo
        self.name.text = post.name
        self.userName.text = post.userName
        self.hashTag.text = post.hashtag
        self.content.text = post.message
        self.postImage.image = post.post
    }
    @IBAction func like(_ sender: UIButton) {
        
        if(likeButton.imageView?.image == #imageLiteral(resourceName: "icon_liked_small"))
        {
            likeButton.setImage(#imageLiteral(resourceName: "icon_like_large"), for: UIControl.State.normal)
        }
        else
        {
            likeButton.setImage(#imageLiteral(resourceName: "icon_liked_small"), for: UIControl.State.normal)
        }
        
    }
    
}
