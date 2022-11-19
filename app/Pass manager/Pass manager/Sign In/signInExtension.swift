//
//  signInExtension.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 09/11/22.
//

import Foundation

import UIKit

extension SignInViewController{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true

    }
    
    func alertMessage(){
        
        let alert = UIAlertController(title: "ALERT", message: "Feilds should not be empty", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        }
            
    func alertMessageforMobile(){
                
        let alert = UIAlertController(title: "ALERT", message: "Enter 10 digits only", preferredStyle: .alert)
                
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
        self.present(alert, animated: true, completion: nil)
        
        }
            
    func alertMessageformPin(){
                
        let alert = UIAlertController(title: "ALERT", message: "Enter correct 4 MPin digits only", preferredStyle: .alert)
                
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
        self.present(alert, animated: true, completion: nil)
        
        }
            
    func containDigit(_ value:String) -> Bool{
            
        let regularExpression = ".*[0-9]+.*"
            
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
                
        return predicate.evaluate(with: value)
        
        }
    
    func alertMessageforSignUp(){
            
        let alert = UIAlertController(title: "ALERT", message: "Please Sign Up First OR Recheck the mobile number and Mpin", preferredStyle: .alert)
            
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
        self.present(alert, animated: true, completion: nil)
            
        }
    
    func checkForMPin(){
        
        let alert = UIAlertController(title: "ALERT", message: "Check your MPin", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        }
}
