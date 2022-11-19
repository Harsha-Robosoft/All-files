//
//  ViewController.swift
//  try
//
//  Created by Harsha R Mundaragi on 28/09/22.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var gmailLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    
    var nameIs : String = ""
    var genderIs : String = ""
    var ageIs : String = ""
    var gmailIs : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        editButton.isEnabled = false
        editButton.alpha = 0.5
    }

    @IBAction func addButton(_ sender: UIButton) {
        
        let secondVcSaveButton = self.storyboard?.instantiateViewController(withIdentifier: "b2ViewController") as! b2ViewController
        secondVcSaveButton.delegate = self
        self.navigationController?.pushViewController(secondVcSaveButton, animated: true)
        
    }
    
    @IBAction func editButton(_ sender: UIButton) {
    
        let thirdVcButton = self.storyboard?.instantiateViewController(withIdentifier: "editViewController") as! editViewController
        
        thirdVcButton.nameToEdit = nameIs
        thirdVcButton.genderToEdit = genderIs
        thirdVcButton.ageToEdit = ageIs
        thirdVcButton.gmailToEdit = gmailIs
            
        thirdVcButton.delegate = self
        
        self.navigationController?.pushViewController(thirdVcButton, animated: true)
    }

    
}

extension ViewController : passDataToViewController {
    func passData(name: String, gender: String, age: Int, gmail: String) {
        
        nameIs = name
        genderIs = gender
        ageIs = String(age)
        gmailIs = gmail
            
        editButton.isEnabled = true
        editButton.alpha = 1
        
        nameLabel.text = nameIs
        genderLabel.text = genderIs
        ageLabel.text = ageIs
        gmailLabel.text = gmailIs
    }
}

extension ViewController : sendEdiedData {
    func editedData(editedName: String, editedGender: String, editedAge: Int, editedGmail: String) {
        
        nameLabel.text = editedName
        genderLabel.text = editedGender
        ageLabel.text = String(editedAge)
        gmailLabel.text = editedGmail
    }
    
    
}


