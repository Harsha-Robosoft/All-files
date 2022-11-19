//
//  followTableViewCell.swift
//  assessmentTwitter
//
//  Created by Harsha R Mundaragi on 13/10/22.
//

import UIKit

class followTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var atName: UILabel!
    @IBOutlet weak var dpImage: UIImageView!
    
    @IBOutlet weak var followbutton: UIButton!
    
    func setDetails(detail : PeoplesDetails)
    {
        name.text = detail.name
        atName.text = detail.atName
        dpImage.image = detail.dp
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        followbutton.setTitleColor(UIColor(red: 3/255, green: 169/255, blue: 244/255, alpha: 1.0), for: UIControl.State.normal)

        followbutton.layer.cornerRadius = 3.0
        followbutton.setTitle("Follow", for: UIControl.State.normal)
        followbutton.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        followbutton.layer.borderWidth = 1.0
        followbutton.layer.borderColor = CGColor(red: 3/255, green: 169/255, blue: 244/255, alpha: 1.0)
        
        
        
    }
    
    @IBAction func followAction(_ sender: Any) {
        
        if ( followbutton.titleLabel?.text == "Follow" )
        {
            followbutton.setTitle("Following", for:UIControl.State.normal)
            followbutton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0),for: UIControl.State.normal)
            followbutton.backgroundColor = UIColor(red: 3/255, green: 169/255, blue: 244/255, alpha: 1.0)
        }
        
        else
        {
            followbutton.setTitle("Follow", for:UIControl.State.normal)
            followbutton.setTitleColor(UIColor(red: 3/255, green: 169/255, blue: 244/255, alpha: 1.0), for: UIControl.State.normal)
            followbutton.layer.borderWidth = 1.0
            followbutton.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            followbutton.layer.cornerRadius = 3.0
        }
    }
    

}
