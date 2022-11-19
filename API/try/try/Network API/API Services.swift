//
//  API Services.swift
//  try
//
//  Created by Harsha R Mundaragi on 15/11/22.
//

import Foundation


class APICall{
    
    func callAPI(completion: @escaping([String:Any]?,Error?) -> ()){
        
        let urlString = "https://api.exchangerate.host/symbols"
        
        guard  let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let err = error{
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
            }else{
                
                guard let data = data else{ return }
                do{
                    
                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                    
                    if let a = result{
                        
                        completion(a,nil)
                        
                        print("$$$$\(a)")
                    }
                    
                    
                }catch let jsonErr{
                    print("JSon Error: \(jsonErr.localizedDescription)")
                }
            }
            
        }.resume()
        
    }
    
    func callCalculationApi(button1: String, button2: String, finalvalu: ((Double) -> (Void))?) {
        
        let urlString = "https://api.exchangerate.host/convert?from=\(button1)&to=\(button2)"
        
        guard  let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let err = error{
                print("Loading data error: \(err.localizedDescription)")
            }else{
                
                guard let data = data else{ return }
                do{
                    
                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                    
                    finalvalu?(result?["result"] as? Double ?? 0.00)
                    
                    
                }catch let jsonErr{
                    print("JSon Error: \(jsonErr.localizedDescription)")
                }
            }
        }.resume()
    }
}
