//
//  editExtension.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 09/11/22.
//

import Foundation

import UIKit

extension EditViewController{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.activeTextField = textField
        
      }
        
      func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.activeTextField = nil
        
      }
    
    func setData() {
        
        urlText.text = detals.url
        
        siteNameText.text = detals.siteName
        
        sectorText.text = detals.sector
        
        userNameText.text = detals.userName
        
        passwordText.text = detals.password
        
        noteText.text = detals.note
        
    }
    
    func isPasswordValid(password: String) -> Bool {
        
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"

        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)

        let result = passwordTest.evaluate(with: password)

        return result

    }
    
    func isUrlValid(url: String) -> Bool {

           let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"

           let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)

           let result = urlTest.evaluate(with: url)

           return result

       }
    
    func alertMessage(message: String){
        
            let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
            self.present(alert,animated: true, completion: nil)
        
        }
    
}

extension EditViewController: GetFolderName{
    
    func folderName(data: String) {
        
        sectorText.text = data
        
        sectorText.reloadInputViews()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == urlText {
            
           textField.resignFirstResponder()
            
           siteNameText.becomeFirstResponder()
            
        }
        else if textField == siteNameText {
            
           textField.resignFirstResponder()
            
           sectorText.becomeFirstResponder()
            
        }
        else if textField == sectorText {
            
           textField.resignFirstResponder()
            
            userNameText.becomeFirstResponder()
            
        }
        else if textField == userNameText {
            
            textField.resignFirstResponder()
            
             passwordText.becomeFirstResponder()
            
         }
        else if textField == passwordText {
            
            textField.resignFirstResponder()
            
            noteText.becomeFirstResponder()
            
         }
        else if textField == noteText {
            
            textField.resignFirstResponder()
            
         }
        textField.resignFirstResponder()

        return true

    }
    
}

