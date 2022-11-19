//
//  setDetailsVc.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 18/10/22.
//

import UIKit

class SiteDetailViewController: UIViewController {

    @IBOutlet weak var urlText: UITextField!
    
    @IBOutlet weak var siteNameText: UITextField!
    
    @IBOutlet weak var sectorText: UITextField!
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var noteText: UITextField!
    
    var details : UserData!
    
    var home : HomeScreenViewController!
    
    var iconClick: Bool = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        urlText.isUserInteractionEnabled = false
        
        siteNameText.isUserInteractionEnabled = false
        
        sectorText.isUserInteractionEnabled = false
        
        userNameText.isUserInteractionEnabled = false
        
        passwordText.isUserInteractionEnabled = false
        
        noteText.isUserInteractionEnabled = false
        
        print(details.password)
        
        setData()

    }
    
    func setData() {
        
        urlText.text = details.url
        
        siteNameText.text = details.siteName
        
        sectorText.text = details.sector
        
        userNameText.text =  details.userName
        
        passwordText.text =  details.password
        
        noteText.text =  details.note
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func editButton(_ sender: Any) {
        
        let nameStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let next = nameStoryboard.instantiateViewController(withIdentifier: "edirVc") as! EditViewController

        next.detals = details

        next.home  = self

        next.passManager = home

        self.navigationController!.pushViewController(next, animated: true)
        
    }

    
    @IBAction func showPassword(_ sender: Any) {
        
        if (iconClick){

        passwordText.isSecureTextEntry = false
                    
        }
        else{

            passwordText.isSecureTextEntry = true

        }

    iconClick = !iconClick
        
    }
    
    
}
