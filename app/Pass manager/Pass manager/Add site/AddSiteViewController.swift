//
//  addSiteVc.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 17/10/22.
//

import UIKit

protocol SavingData {

    func saveData()

}

protocol sendEnteredData{
    
    func data(siteUrl: String, siteName: String)
    
}

class AddSiteViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var urlText: UITextField!
    
    @IBOutlet weak var siteNameText: UITextField!
    
    @IBOutlet weak var sectorText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var noteText: UITextField!
    
    @IBOutlet weak var hideIcon: UIButton!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passwordStrength: UILabel!
    
    weak var homeDelegate: HomeScreenViewController!

    weak var userDelegate: UserData!
    
    var iconClick: Bool = true
    
    var activeTextField : UITextField? = nil

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddSiteViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          
        NotificationCenter.default.addObserver(self, selector: #selector(AddSiteViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        CongfigureTextFields()

        ConfigureTapGesture()
        
        passwordStrength.isHidden = true

        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            
           return
            
        }
        
        var shouldMoveViewUp = false

          if let activeTextField = activeTextField {

            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            if bottomOfTextField > topOfKeyboard {
                
              shouldMoveViewUp = true
                
            }
            
          }

          if(shouldMoveViewUp) {
            
            self.view.frame.origin.y = 0 - keyboardSize.height
            
          }
        
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        
      self.view.frame.origin.y = 0
        
    }
    
    private func CongfigureTextFields(){

        urlText.delegate = self

        siteNameText.delegate = self
        
        sectorText.delegate = self

        passwordText.delegate = self
        
        userName.delegate = self

        noteText.delegate = self

    }

    private func ConfigureTapGesture(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddSiteViewController.handleTap))

        view.addGestureRecognizer(tapGesture)

    }

    @objc func handleTap(){

        print("handle tap was called")

        view.endEditing(true)

    }
    
    
    
    
    @IBAction func hidePassword(_ sender: Any) {
        
        if (iconClick){

        passwordText.isSecureTextEntry = false
                    
        }
        
        else{

            passwordText.isSecureTextEntry = true

        }

    iconClick = !iconClick
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        homeDelegate.saveData()
        
    }
    
    @IBAction func resetIt(_ sender: UIButton) {
        
        urlText.text = ""
        
        passwordText.text = ""
        
        siteNameText.text = ""
        
        sectorText.text = ""
        
        noteText.text = ""
        
        userName.text = ""
        
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        view.endEditing(true)
        
        userDelegate.url = urlText.text!

        userDelegate.userName = userName.text!

        userDelegate.siteName = siteNameText.text!

        userDelegate.sector = sectorText.text!

        userDelegate.password = passwordText.text!

        userDelegate.note = noteText.text!

        homeDelegate.saveData()
        
        guard let _ = urlText.text, isUrlValid(url: urlText.text!) else {
            
            alertMessage(message: "Enter a valid URL")
            
            return
            
        }

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(homeDelegate.currentUser.mobileNumber+".txt")
        
        do {

        let data = try NSKeyedArchiver.archivedData(withRootObject: homeDelegate.currentUser.details, requiringSecureCoding: false)

            try data.write(to: path)

        }
        
        catch {

            print("ERROR: \(error.localizedDescription)")

        }

        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func dropDown(_ sender: Any) {
        
        let topAnchorValue = UIScreen.main.bounds.height * 0.5
        
        let vc = SelectorViewController(topAnchorValue: topAnchorValue)
        
        vc.modalPresentationStyle = .overCurrentContext
        
        present(vc, animated: true, completion: nil)
        
        vc.eddVcObject = self
        
    }
    
    
    @IBAction func passwordField(_ sender: Any) {
        
        if let password = passwordText.text {
            
            if isPasswordValid(password: password){
                
                passwordStrength.isHidden = false
                
                passwordStrength.layer.masksToBounds = true
                
                passwordStrength.layer.cornerRadius = 2
                
                passwordStrength.backgroundColor = .systemGreen
                
            }
            else{
                
                passwordStrength.isHidden = false
                
                passwordStrength.layer.masksToBounds = true
                
                passwordStrength.layer.cornerRadius = 2
                
                passwordStrength.backgroundColor = .systemRed
                
            }
            
        }
        
    }
    
}


