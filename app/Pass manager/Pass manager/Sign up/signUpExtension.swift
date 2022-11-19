//
//  signUpFunctions.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 09/11/22.
//

import Foundation

import UIKit

extension SignUpViewController{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true

    }

    func alertMessage(message: String){
        
            let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
            self.present(alert,animated: true, completion: nil)
        }
        
        func containsDigit(_ value: String) -> Bool
        {
            let reqularExpression = ".*[0-9]+.*"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            
            return predicate.evaluate(with: value)
        }
        
        func alertMessageforMobile(){
            
            let alert = UIAlertController(title: "ALERT", message: "Enter 10 digits only", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert,animated: true, completion: nil)
        }

    func alertMessageforExsistingUser(message: String){

        let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        self.present(alert,animated: true, completion: nil)

          }

    func showToast(message : String, controller: UIViewController) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 90 , y: self.view.frame.size.height + 130, width: 250, height: 66))

        toastLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        toastLabel.textColor = UIColor.white

        toastLabel.font = .systemFont(ofSize: 17.0)

        toastLabel.textAlignment = .center;

        toastLabel.text = message

        toastLabel.alpha = 1.0

        toastLabel.numberOfLines = 2

        toastLabel.layer.cornerRadius = 10;

        toastLabel.clipsToBounds  =  true

        controller.view.addSubview(toastLabel)

        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {

        toastLabel.alpha = 0.0 }, completion: {(isCompleted) in

        toastLabel.removeFromSuperview()

        })
        
    }

    
}

