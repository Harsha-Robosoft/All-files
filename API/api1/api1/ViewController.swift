//
//  ViewController.swift
//  api1
//
//  Created by Harsha R Mundaragi on 10/11/22.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://api.exchangerate.host/latest"
        
        
        fetchData(from: url){ result in
            
            
        }
        
    }

    
    
    func fetchData(from url: String, completion: @escaping (Result<Rates, Error>) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else{
                print("error")
                
                return
            }
            
            var result: Rates?
            do{
                result = try JSONDecoder().decode(Rates.self, from: data)
            } catch{
                print("error\(error.localizedDescription)")
            }
            
            guard let json = result else{
                return
            }
            
            completion(result)
//            print("^^^^^^\(json.rates)")
            
        }).resume()
        
    }
    
}



