//
//  editViewController.swift
//  try
//
//  Created by Harsha R Mundaragi on 03/10/22.
//

import UIKit

protocol sendEdiedData {
    func editedData(editedName : String,editedGender : String,editedAge: Int,editedGmail : String)
}

class editViewController: UIViewController {

    @IBOutlet weak var editedName: UITextField!
    @IBOutlet weak var editedGender: UITextField!
    @IBOutlet weak var editedAge: UITextField!
    @IBOutlet weak var editedGmail: UITextField!
    
    @IBOutlet weak var saveAgain: UIButton!
    
    
    var nameToEdit : String = ""
    var genderToEdit : String = ""
    var ageToEdit : String = ""
    var gmailToEdit : String = ""
    
    var sendEditedName = ""
    var sendEditedGender = ""
    var sendEditedGmail = ""
    
    var delegate : sendEdiedData!
    
    var genderAre = ["Male","male","m","M","Female","female","F","f","Trans gender","Transgender","Trans Gender","transgender","t"]
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        editedName.text = nameToEdit
        editedGender.text = genderToEdit
        editedAge.text = ageToEdit
        editedGmail.text = gmailToEdit
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveAgain(_ sender: Any) {
        

        
        if ((editedGmail.text?.isThisValidEmail) != nil)
        {
            sendEditedGmail = editedGmail.text!
        }
        else
        {
            sendEditedGmail = "Enter a valid Id"
        }
        
        if (editedName.text != "")
        {
            sendEditedName = editedName.text!
        }
        else
        {
            sendEditedName = "Enter name"
        }
        
        if (genderAre.contains(editedGender.text!))
        {
            sendEditedGender = editedGender.text!
        }
        else
        {
            sendEditedGender = "Enter a valid gender"
        }
        
//        print(sendEditedGender,sendEditedName,sendEditedGmail)

        
        if ( sendEditedGmail != "Enter a valid Id" && sendEditedName != "Enter name" && sendEditedGender != "Enter a valid gender" )
        {
            delegate.editedData(editedName: sendEditedName , editedGender: sendEditedGender, editedAge: Int(editedAge.text ?? "") ?? 0 , editedGmail: sendEditedGmail)
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
    
}

extension String{
    
    var isThisValidEmail: Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        
        let emeilTest = NSPredicate(format: "SELF MATCHES %@",emailRegEx)
        return emeilTest.evaluate(with: self)
    }
    
}
