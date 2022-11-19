//
//  ViewController.swift
//  Pass manager app
//
//  Created by Harsha R Mundaragi on 22/10/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var segmentOutLet: UISegmentedControl!
    
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var signUpView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true

        
        self.view.bringSubviewToFront(signInView)
        
    }

    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        
        switch segmentOutLet.selectedSegmentIndex {
        case 0:
            print("hi")
            self.view.bringSubviewToFront(signInView)
        case 1:
            print("hello")
            self.view.bringSubviewToFront(signUpView)
        default:
            break
        }
        
    }
    
    
    
    

}

