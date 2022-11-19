//
//  ViewController.swift
//  try
//
//  Created by Harsha R Mundaragi on 14/11/22.
//

import UIKit

class FirestViewController: UIViewController, setData {
    
    var objectOfAPICall = APICall()
        
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
        
        let select = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        
        select.onClickSource = true
        
        select.delegate = self
        
        self.navigationController?.pushViewController(select, animated: true)
    }
    
    @IBAction func destinationButtonTapped(_ sender: Any) {
        let select = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        
        select.delegate = self
        
        self.navigationController?.pushViewController(select, animated: true)
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
    
    func setData(data: String, onClickSource: Bool, onClickDestination: Bool) {
        
        if onClickSource == true{
            
            sourceButton.setTitle(data, for: .normal)
            
            if(destinationButton.currentTitle != "Destination"){
                
                objectOfAPICall.callCalculationApi(button1: sourceButton.currentTitle ?? "", button2: destinationButton.currentTitle ?? "" ){ value in
                    self.reload(apiValue: value)
                }
            }
        }
        else{
            
            destinationButton.setTitle(data, for: .normal)
            
            if(destinationButton.currentTitle != "Source"){
                
                objectOfAPICall.callCalculationApi(button1: sourceButton.currentTitle ?? "", button2: destinationButton.currentTitle ?? "" ){ value in
                    self.reload(apiValue: value)
                }
            }
        }
    }
}



