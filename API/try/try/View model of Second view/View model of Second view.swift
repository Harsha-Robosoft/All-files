//
//  ViewMode.swift
//  try
//
//  Created by Harsha R Mundaragi on 15/11/22.
//

import Foundation


class SecondViewModel {
    
    var objectOfAPICall = APICall()
    
    
    func callApiWithViewModel(success: ((CuntryAndCuntryCode) -> ())?, fail: ((String)->())?){
        
        objectOfAPICall.callAPI{ result, error in
            if error == nil{
                
                let value = result?["symbols"] as? [String: Any]
                
                if let value1 = value{
                    
                    for c in value1.keys {
                        
                        if let value2 = value1[c] {
                            
                            let value3 = value2 as? [String: String]
                            
                            let object =  CuntryAndCuntryCode(countryData: value3 ?? ["":""])
                            
                            success?(object)
                        }
                    }
                }
            }
            else{
                fail?("ERROE")
            }
        }
    }
}

