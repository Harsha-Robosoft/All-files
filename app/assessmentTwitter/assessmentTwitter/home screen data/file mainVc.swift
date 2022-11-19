//
//  file mainVc.swift
//  assessmentTwitter
//
//  Created by Harsha R Mundaragi on 12/10/22.
//

import Foundation
import UIKit

class Tweet
{
    var logo : UIImage
    var name : String
    var userName : String
    var hashtag : String
    var message : String
    var post : UIImage
    
    init(logo : UIImage,name : String,userName : String,hashtag : String,message : String,post : UIImage)
    {
        self.logo = logo
        self.name = name
        self.userName = userName
        self.hashtag = hashtag
        self.message = message
        self.post = post
    }
}
