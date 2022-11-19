//
//  ViewController.swift
//  text fiels
//
//  Created by Harsha R Mundaragi on 23/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passeordField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameField.delegate = self
        passeordField.delegate = self
        phoneNumberField.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func enterTapped(_ sender: Any) {
        textView.text = "User Name : \(userNameField.text!)\nPass word : \(passeordField.text!)\nPhone number : \(phoneNumberField.text!)"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumberField.resignFirstResponder()
    }
}

extension ViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
