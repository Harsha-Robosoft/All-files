//
//  ViewController.swift
//  PassDataInTwoDirection
//
//  Created by Harsha R Mundaragi on 28/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button1(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as? secondViewController
        vc?.data = textField1.text!
        vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}

extension ViewController: passDataToVC {
    func passdata(str: String) {
        textField1.text = str
    }
    
    
}
