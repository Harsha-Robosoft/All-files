//
//  ViewController.swift
//  passData
//
//  Created by Harsha R Mundaragi on 28/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var nameIs = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func enterTapped(_ sender: Any) {
        
        self.nameIs = textField.text!
            performSegue(withIdentifier: "name", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! nameViewController
        vc.finalName = self.nameIs
        
    }

}

