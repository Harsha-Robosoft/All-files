//
//  APIService.swift
//  Currency converter
//
//  Created by Harsha R Mundaragi on 10/11/22.
//

import UIKit

class APIService: NSObject {
    
    var finalValu : Double = 0.00
    
    
    static let shareInstance = APIService()
    
    func getAllCountryData(completion: @escaping(CountryModel?, Error?) -> ()) {
        
        let urlString = "https://api.exchangerate.host/symbols"
        
        guard  let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let err = error{
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
            }else{
                
                guard let data = data else{ return }
                do{
                    
                   let result = try JSONDecoder().decode(CountryModel.self, from: data)
                    
                    completion(result, error)
                    
                }catch let jsonErr{
                    print("JSon Error: \(jsonErr.localizedDescription)")
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
