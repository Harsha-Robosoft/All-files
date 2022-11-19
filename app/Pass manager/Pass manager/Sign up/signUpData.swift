//
//  signUpData.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 18/10/22.
//

import Foundation

var signUpData = [SignUpDataOfUser]()

class SignUpDataOfUser: NSObject, NSCoding{
    
    var userMobileNumber : String
    
    var userMPin : String
    
    init(userMobileNumber : String,userMPin : String) {
        
        self.userMobileNumber = userMobileNumber
        
        self.userMPin = userMPin
        
    }
    
    func encode(with coder: NSCoder){
        
        coder.encode(userMobileNumber, forKey: "userMobileNumber")
        
        coder.encode(userMPin, forKey: "userMPin")
        
    }
    
    required convenience init?(coder: NSCoder){
        
        guard let mobileNumber = coder.decodeObject(forKey: "userMobileNumber") as? String,
              
              let mPin = coder.decodeObject(forKey: "userMPin") as? String
        
        else{
            
            return nil
            
        }
        
        self.init(userMobileNumber: mobileNumber, userMPin: mPin)
        
    }

}


