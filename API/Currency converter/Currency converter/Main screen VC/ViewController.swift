//
//  ViewController.swift
//  Currency converter
//
//  Created by Harsha R Mundaragi on 10/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var api = APIService.shareInstance
    
    @IBOutlet weak var firstSelectedButton: UIButton!
    
    @IBOutlet weak var secondSelectedButton: UIButton!
    
    @IBOutlet weak var sourcePrice: UITextField!
    
    @IBOutlet weak var destinationPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Currency Converter"
        
        firstSelectedButton.layer.cornerRadius = 5.0
        
        secondSelectedButton.layer.cornerRadius = 5.0

    }

    @IBAction func firstSelection(_ sender: Any) {
        
        let select = self.storyboard?.instantiateViewController(withIdentifier: "CountryListViewController") as! CountryListViewController
        
        select.onClickSource = true
        
        select.delegate = self
        
        self.navigationController?.pushViewController(select, animated: true)
        
    }
    
    @IBAction func secondSelectoin(_ sender: Any) {
        
        let select = self.storyboard?.instantiateViewController(withIdentifier: "CountryListViewController") as! CountryListViewController
        
        select.delegate = self
        
        self.navigationController?.pushViewController(select, animated: true)
        
    }
    
    func reload(apiValu: Double) {
        
        DispatchQueue.main.async {
                
            if let price = self.sourcePrice.text {

                if let p = Double(price) {

                   self.destinationPrice.text = String( p * Double(apiValu))

                }
            }
        }
    }
}


extension ViewController: setData{
    
    func setData(data: String, onClickSource: Bool, onClickDestination: Bool) {
        
        if onClickSource == true{
            
            firstSelectedButton.setTitle(data, for: .normal)
            
            if(secondSelectedButton.currentTitle != "Destination"){
                
                api.callApi(button1: firstSelectedButton.currentTitle ?? "", button2: secondSelectedButton.currentTitle ?? "" ){ u in
                    
                    print(u)
                    self.reload(apiValu: u)
                }
                
               
                
            }
            
        }
        else{
            
            secondSelectedButton.setTitle(data, for: .normal)
            
            if(secondSelectedButton.currentTitle != "Source"){
                
                api.callApi(button1: firstSelectedButton.currentTitle ?? "", button2: secondSelectedButton.currentTitle ?? "" ){ u in
                    
                    print(u)
                    self.reload(apiValu: u)
                }
                
                
            }
            
        }
        
    }
    
}
