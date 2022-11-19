//
//  b2ViewController.swift
//  try
//
//  Created by Harsha R Mundaragi on 28/09/22.
//

import UIKit


protocol passDataToViewController {
    func passData(name : String , gender : String, age : Int , gmail: String)
}

class b2ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var gmailTextField: UITextField!
    @IBOutlet weak var savedatabutton: UIButton!
    
        
    var genderV = ""
    var gmailV = ""
    
    var gmailValid =  ""
    var gendeValid = ""
    
    var genderIs = ["Male","male","m","M","Female","female","F","f","Trans gender","Transgender","Trans Gender","transgender","t"]
    
    var delegate : passDataToViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        self.gmailV = gmailTextField.text ?? ""
        self.genderV = genderTextField.text ?? ""
        
        if (gmailV.isValidEmail)
        {
            gmailValid = gmailV
        }
        else
        {
            gmailValid = "Enter a valid Id"
        }
        
        if (nameTextField.text == "")
        {
            nameTextField.text = "Enter name"
        }
        else
        {
            nameTextField.text = nameTextField.text
        }
        
        if genderIs.contains(genderV)
       {
            gendeValid = genderV
       }
        else
       {
        gendeValid = "Enter a valid gender"
       }
        
        
        if (gmailValid != "Enter a valid Id" && gendeValid != "Enter a valid gender" && nameTextField.text != "Enter name" )
        {
            delegate.passData(name:nameTextField.text ?? "", gender: gendeValid , age: Int(ageTextField.text ?? "") ?? 0 , gmail: gmailValid)
       
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        
    }
    
}

extension String{
    
    var isValidEmail: Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        
        let emeilTest = NSPredicate(format: "SELF MATCHES %@",emailRegEx)
        return emeilTest.evaluate(with: self)
    }
    
}

