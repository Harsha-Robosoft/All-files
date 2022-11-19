//
//  edirVc.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 18/10/22.
//

import UIKit

protocol Reload {
    
    func reload()
    
}

class EditViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var urlText: UITextField!
    
    @IBOutlet weak var siteNameText: UITextField!
    
    @IBOutlet weak var sectorText: UITextField!
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var noteText: UITextField!
    
    @IBOutlet weak var passwordStrength: UILabel!
    
    var detals : UserData!
    
    var home : SiteDetailViewController!
    
    var passManager : HomeScreenViewController!
    
    var iconClick: Bool = true
    
    var activeTextField : UITextField? = nil

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(EditViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          
        NotificationCenter.default.addObserver(self, selector: #selector(EditViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        CongfigureTextFields()

        ConfigureTapGesture()

        setData()
        
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
        
        userNameText.delegate = self

        noteText.delegate = self

    }

    private func ConfigureTapGesture(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EditViewController.handleTap))

        view.addGestureRecognizer(tapGesture)

    }

    @objc func handleTap(){

        print("handle tap was called")

        view.endEditing(true)

    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func updateThedata(_ sender: Any) {
        
        view.endEditing(true)
        
        detals.url = urlText.text!
        
        detals.siteName = siteNameText.text!
        
        detals.sector = sectorText.text!
        
        detals.userName = userNameText.text!
        
        detals.password = passwordText.text!
        
        detals.note = noteText.text!
        
        home.setData()
        
        passManager.reload()
        
        
        guard let _ = urlText.text, isUrlValid(url: urlText.text!) else {
            
            alertMessage(message: "Enter a valid URL")
            
            return
            
        }
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]

        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
        
    }
    
    @IBAction func shoePassBord(_ sender: Any) {
        
        if (iconClick){

        passwordText.isSecureTextEntry = false
                    
        }
        else{

            passwordText.isSecureTextEntry = true

        }

    iconClick = !iconClick
        
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

