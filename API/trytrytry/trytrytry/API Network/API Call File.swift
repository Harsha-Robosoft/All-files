//
//  API Call File.swift
//  trytrytry
//
//  Created by Harsha R Mundaragi on 17/11/22.
//

import Foundation


class APICall {
    
    func callApi(url: String, completion: @escaping([String:Any]?,Error?) -> ()) {
        
        URLSession.shared.dataTask(with: URL(string: url)!){ (data, response, error) in
            
            if let err = error {
                
                completion(nil,err)
                print("error: \(err.localizedDescription)")
            }else{
                
                if let respo = response as? HTTPURLResponse{
                    
                    if respo.statusCode == 200{
                        if let data = data {
                            do{
                                
                                let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                                
                                completion(jsonData, nil)
                                
                            } catch{
                                
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
                
            }
            
        }.resume()
        
    }
    
    func callApi(button1: String, button2: String, finalvalu: ((Double) -> (Void))?) {
    
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
