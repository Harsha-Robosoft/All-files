//
//  tabBar.swift
//  assessmentTwitter
//
//  Created by Harsha R Mundaragi on 13/10/22.
//

import UIKit

class tabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let logo = UIImage(named: "twitter_logo_small.png")
        self.navigationItem.titleView = UIImageView(image: logo)

    }
    

    @IBAction func logOutButton(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
