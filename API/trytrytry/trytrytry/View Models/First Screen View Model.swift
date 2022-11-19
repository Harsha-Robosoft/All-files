//
//  First Screen View Model.swift
//  trytrytry
//
//  Created by Harsha R Mundaragi on 17/11/22.
//

import Foundation


class FirestScreenViewModel {
    
    var objectOfApiCall = APICall()
    
    func callingApiFromViewModel( success:@escaping ([String: String]) -> (),fail: @escaping (Any) -> ()){
        
        objectOfApiCall.callApi(url: "https://api.exchangerate.host/symbols"){ dataIs,errorIs  in
            
            if errorIs == nil{

                let value = dataIs?["symbols"] as? [String: Any]
                
                if let value1 = value{
                    
                    
                    for i in value1.keys {
                        

                        if let value2 = value1[i] {
                            
                            let value3 = value2 as? [String: String]
                    
                            
                            let object = value3
                            
                            success(object ?? ["":""])
                        }
                    }
                }
            }else{
                fail(errorIs)
            }
        }
    }
}
