//
//  mainTableViewCell.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 17/10/22.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var urltext: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    var password : String!
            
    func setData(cell: HomeScreenTableViewCell, indexPath: IndexPath) {
        
    let random = Int.random(in: 1...4)
        
    if (cell.name.text == "Facebook" || cell.name.text == "faceBook" || cell.name.text == "FACEBOOK" || cell.name.text == "facebook") {
        
        logoImage.image = #imageLiteral(resourceName: "images")

    }

    else if (cell.name.text == "instagram" || cell.name.text == "Instagram" || cell.name.text == "INSTAGRAM") {

        logoImage.image = #imageLiteral(resourceName: "MicrosoftTeams-image")

    }

    else if (cell.name.text == "twitter" || cell.name.text == "Twitter" || cell.name.text == "TWITTER") {

        logoImage.image = #imageLiteral(resourceName: "MicrosoftTeams-image (1)")
        
    }

    else if (cell.name.text == "Pinterest" || cell.name.text == "PINTEREST" || cell.name.text == "pinterest") {

        logoImage.image = #imageLiteral(resourceName: "MicrosoftTeams-image (3)")

    }
        
    else{

        switch random {

        case 1: logoImage.image = #imageLiteral(resourceName: "images")

        case 2: logoImage.image = #imageLiteral(resourceName: "MicrosoftTeams-image (3)")

        case 3: logoImage.image = #imageLiteral(resourceName: "MicrosoftTeams-image")

        case 4: logoImage.image = #imageLiteral(resourceName: "MicrosoftTeams-image (1)")

        default:

        logoImage.image = #imageLiteral(resourceName: "search")

        }
                        
    }

}
    
    func setcardView(){
        
        cardView.layer.shadowColor = UIColor.systemGray4.cgColor
        
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        cardView.layer.shadowOpacity = 1.0
        
        cardView.layer.masksToBounds = false
        
        cardView.layer.cornerRadius = 2.0
        
    }
    
    @IBAction func copyPassword(_ sender: Any) {
        
        if let password = self.password{
            
            UIPasteboard.general.string = password
            
        }
        
    }
    
}
