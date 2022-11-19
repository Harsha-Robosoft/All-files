//
//  signUpVc.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 17/10/22.
//

import UIKit

protocol SendAction {
    
}



class SignUpViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var signUpMobileNumber: UITextField!
    
    @IBOutlet weak var signUpMPin: UITextField!
    
    @IBOutlet weak var signUpReEnterMPin: UITextField!
   
    @IBOutlet weak var signInButton: UIButton!
    
    var signUpUserData: SignUpDataOfUser!
    
    var iconClick: Bool = true
    
    var f = 0
  
    var delegate: SendAction?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        CongfigureTextFields()

        ConfigureTapGesture()
        
        signUpMobileNumber.setPaddding()
        
        signUpMPin.setPaddding()
        
        signUpReEnterMPin.setPaddding()
        
        signInButton.layer.masksToBounds = true
        
        signInButton.layer.cornerRadius = 5.0

    }
    
    private func CongfigureTextFields(){

        signUpMobileNumber.delegate = self

        signUpReEnterMPin.delegate = self

    }

    private func ConfigureTapGesture(){

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleTap))

        view.addGestureRecognizer(tapGesture)

    }

    @objc func handleTap(){

        print("handle tap was called")

        view.endEditing(true)

    }
    
    

    
    
    @IBAction func signInButton(_ sender: UIButton) {
        
        view.endEditing(true)
        
        guard let number = signUpMobileNumber.text, signUpMobileNumber.text?.count != 0 else {
            
                    alertMessage(message: "Mobile Number field Should not be empty")
            
                    return
            
        }
                
                guard containsDigit(number), number.count == 10 else{
                    
                    alertMessage(message: "Enter digits not exceeding 10 charachters")
                    
                    return
                    
                }
                
        guard let pin = signUpMPin.text, signUpMPin.text?.count != 0 else {
            
                    alertMessage(message: "MPin field should not be empty")
            
                    return
            
        }
                
                guard containsDigit(pin), pin.count == 4 else{
                    
                    alertMessage(message: "Enter digits not exceeding 4 characters")
                    
                    return
                    
                }
                
        guard let reEnterMpin = signUpReEnterMPin.text, signUpReEnterMPin.text?.count != 0 else{
            
                    alertMessage(message: "Re-Enterd MPin field should not be empty")
            
                    return
            
        }
                
                guard containsDigit(reEnterMpin), reEnterMpin.count == 4 else {
                    
                    alertMessage(message: "Enter digits not exceeding 4 characters")
                    
                    return
                    
        }
                
        guard pin == signUpReEnterMPin.text else {
                    
                    alertMessage(message: "Re-Entered MPin does not match Mpin")
                    return
        }
        
        for i in signUpData{
            
        if( i.userMobileNumber == signUpMobileNumber.text) {

            f = 1

            alertMessageforExsistingUser(message: "You are already Signed In")

            break;

            }
            
        }
        
        if (f == 0) {
            
        _ = UIStoryboard(name: "Main", bundle: nil)
        
        let currentLogin = SignUpDataOfUser(userMobileNumber: number, userMPin: pin)
        signUpData.append(currentLogin)
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("values.txt")
        
        do {
            
            let data = try NSKeyedArchiver.archivedData(withRootObject: signUpData, requiringSecureCoding: false)
            
            try data.write(to: path)
            
        }
        catch {
            
            print("ERROR: \(error.localizedDescription)")
            
        }

//        let signUpVc1 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//
//        self.showToast(message: "Congrats..!!! you are Signed Up", controller: signUpVc1)
//
//        self.navigationController?.pushViewController(signUpVc1, animated: true)
            
            let dc = delegate as! ViewController
            dc.segmentOutLet.selectedSegmentIndex = 0
            dc.segmentOutLet(dc.segmentOutLet)
            
        }
    }
    
    
    @IBAction func showMPin(_ sender: Any) {
        
        if (iconClick){
            
            signUpReEnterMPin.isSecureTextEntry = false
            
        }
        else{
            
            signUpReEnterMPin.isSecureTextEntry = true
            
        }
        
        iconClick = !iconClick
        
    }
        
}
    
    
    




