//
//  LoginViewController.swift
//  Two screen
//
//  Created by Harsha R Mundaragi on 27/09/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordtextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginTapped(_ sender: Any) {
        navigateToMainInterface()
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    private func navigateToMainInterface(){
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let mainNavigationVC =  mainStoryBoard.instantiateViewController(withIdentifier: "MainNavigationController") as? MainNavigationController else {
            return
        }
        
        print(mainNavigationVC.topViewController)
        print(mainNavigationVC.viewControllers)
        
        
        if let mainVC = mainNavigationVC.topViewController as? ViewController {
            mainVC.userName = userNameTextField.text
            mainVC.passWord = passWordtextField.text
        }
        
        present(mainNavigationVC, animated: true, completion: nil)
    }
}
