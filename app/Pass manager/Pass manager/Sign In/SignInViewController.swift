//
//  signInVc.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 17/10/22.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    var isIconClick: Bool = true
    
    @IBOutlet weak var signInMobileNumber: UITextField!
    
    @IBOutlet weak var signInMPin: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var x = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CongfigureTextFields()

        ConfigureTapGesture()
        
        signInMobileNumber.setPaddding()
        
        signInMPin.setPaddding()
        
        signInButton.layer.masksToBounds = true
        
        signInButton.layer.cornerRadius = 5.0

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("values.txt")
        
        do {
            
            let data = try Data(contentsOf: path)
            
            if let value = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [SignUpDataOfUser] {
                
                signUpData = value
                
            }
            
        } catch {
            
            print("ERROR: \(error.localizedDescription)")
            
        }

    }
    
    private func CongfigureTextFields(){

        signInMobileNumber.delegate = self

        signInMPin.delegate = self

    }

    private func ConfigureTapGesture(){

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.handleTap))

            view.addGestureRecognizer(tapGesture)

    }

    @objc func handleTap(){

        print("handle tap was called")

        view.endEditing(true)

    }

    
    
    @IBAction func signInButton2(_ sender: UIButton) {

        view.endEditing(true)
        
        guard let number = signInMobileNumber.text , signInMobileNumber.text?.count != 0 else{
            
            alertMessage()
            
            return
            
        }
            
        guard containDigit(number), number.count == 10 else{
            
            alertMessageforMobile()
            
            return
            
        }
            
        guard let pin = signInMPin.text, signInMPin.text?.count != 0 else {
            
            alertMessage()
            
            return
            
        }
                
        guard containDigit(pin), pin.count == 4 else{
            
            alertMessageformPin()
            
            return
            
        }
        
        for i in signUpData{
            
            if(i.userMobileNumber == signInMobileNumber.text){
            
            if(i.userMobileNumber == signInMobileNumber.text && i.userMPin == signInMPin.text){
                _ = UIStoryboard(name: "Main", bundle: nil)
                
                let mainVc2 = self.storyboard?.instantiateViewController(withIdentifier: "mainScreenVc") as! HomeScreenViewController
                
                mainVc2.mobileNumber = signInMobileNumber.text!
                
                self.navigationController?.pushViewController(mainVc2, animated: true)
                
                x = 1
                
            }
            
            else{
                
                x = 2
                
                
            }
            
                break
        }
    }
        
        switch x {

        case 0:

            alertMessageforSignUp()

        case 2:

            checkForMPin()

        default:

            break

        }
        
    }
    
    @IBAction func shoeEnteredSignInMPin(_ sender: Any) {
        
        if (isIconClick){
            
            signInMPin.isSecureTextEntry = false
            
        }
        
        else{
            
            signInMPin.isSecureTextEntry = true
        }
        
        isIconClick = !isIconClick
        
    }
  
}
