//
//  dataViewController.swift
//  Table view data sending
//
//  Created by Harsha R Mundaragi on 10/10/22.
//

import UIKit

protocol sendData {
    func details(name : String, gender: String, age : Int, gmail : String)
}

class secondVC: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var gmailText: UITextField!
    
    var validateAge = 0
    var validatedGmail = ""
    var validatedGender = ""
    var validatedName = ""
    
    var checkGmail = ""
    var checkGender = ""
    
    var delegate : mainVC!
    
    var currentObject : PersonData!

    var genderIs = ["Male","male","m","M","Female","female","F","f","Trans gender","Transgender","Trans Gender","transgender","t"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dataSaveButton(_ sender: UIButton) {
        
        self.checkGmail = gmailText.text ?? ""
        self.checkGender = genderText.text ?? ""
        self.validateAge = Int(ageText.text ?? "") ?? 0
        
        if (checkGmail.isValidEmail)
        {
            validatedGmail = checkGmail
        }
        else
        {
            validatedGmail = "Enter a valid gmail"
        }
        
        if (genderIs.contains(checkGender))
        {
            validatedGender = checkGender
        }
        else
        {
            validatedGender = "Enter gender"
        }
        
        if (nameText.text != "")
        {
            validatedName = nameText.text ?? ""
        }
        else
        {
            validatedName = "Enter name"
        }
        
        
        
        if ( validatedGmail != "Enter a valid gmail" && validatedGender != "Enter gender" && validatedName != "Enter name")
        {
            
            
            delegate.details(name: validatedName, gender: validatedGender, age: Int(ageText.text ?? "") ?? 0, gmail: validatedGmail)
            
//            delegate.details(name: nameText.text ?? "", gender: genderText.text ?? "", age: Int(ageText.text ?? "") ?? 0, gmail: gmailText.text ?? "")
            
            currentObject.name = validatedName
            currentObject.gender = validatedGender
            currentObject.age = validateAge
            currentObject.gmail = validatedGmail

            let tableVc = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! mainVC

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
