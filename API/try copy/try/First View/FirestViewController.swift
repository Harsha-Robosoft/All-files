//
//  ViewController.swift
//  try
//
//  Created by Harsha R Mundaragi on 14/11/22.
//

import UIKit

class FirestViewController: UIViewController {
    
    var objectOfAPICall = APICall()
    
    var second = secondViewController()
        
    @IBOutlet weak var sourceButton: UIButton!
    
    @IBOutlet weak var destinationButton: UIButton!
    
    @IBOutlet weak var priceEntred: UITextField!
    
    @IBOutlet weak var convertedValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Currency Converter"
        
        sourceButton.layer.cornerRadius = 5.0
        
        destinationButton.layer.cornerRadius = 5.0
        
    }
    
    @IBAction func sourceButtonTapped(_ sender: Any) {
        
        second = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        
        second.onClickSource = true
        
        
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    @IBAction func destinationButtonTapped(_ sender: Any) {
        second = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        
        
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    func reload(apiValue: Double) {
        
        DispatchQueue.main.async {
            
            if let price = self.priceEntred.text {
                
                if let p = Double(price) {
                    
                    self.convertedValue.text = String( p * Double(apiValue))
                    
                }
            }
        }
    }
    
    func setData() {
        
        second.completion = { dict in
            
            var  x = dict["a"]
            var y = dict["b"]
            var z = dict["c"]
            
            if (y != nil)  == true{
                
                self.sourceButton.setTitle(x as! String, for: .normal)
                
                if(self.destinationButton.currentTitle != "Destination"){
                    
                    self.objectOfAPICall.callCalculationApi(button1: self.sourceButton.currentTitle ?? "", button2: self.destinationButton.currentTitle ?? "" ){ value in
                        self.reload(apiValue: value)
                    }
                }
            }
            else{
                
                self.destinationButton.setTitle(x as! String, for: .normal)
                
                if(self.destinationButton.currentTitle != "Source"){
                    
                    self.objectOfAPICall.callCalculationApi(button1: self.sourceButton.currentTitle ?? "", button2: self.destinationButton.currentTitle ?? "" ){ value in
                        self.reload(apiValue: value)
                    }
                }
            }
            
        }
        
        
    }
}



