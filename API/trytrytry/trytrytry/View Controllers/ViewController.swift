//
//  ViewController.swift
//  trytrytry
//
//  Created by Harsha R Mundaragi on 17/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var objectOfAPiCall = APICall()
        
    var filaData = [String:String]()
    
    var objectOfData = Data()
    
    var objectOfViewMOdel = FirestScreenViewModel()

    @IBOutlet weak var valueEntered: UITextField!
    
    @IBOutlet weak var sourceButton: UIButton!
    
    @IBOutlet weak var destinationButtion: UIButton!
    
    @IBOutlet weak var convertedValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectOfViewMOdel.callingApiFromViewModel(){ successData in
            
            self.filaData = successData
            
            if let a = self.filaData["description"]{
            
                self.objectOfData.nameData.append(a)
            
            }
            
            if let a = self.filaData["code"]{
            
                self.objectOfData.codeData.append(a)
            
            }
            
            
            
        } fail: { failureError in
            
            print(failureError)
        }

    }
    
    @IBAction func sourceButtonTapped(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(identifier: "Table_View_controller") as! Table_View_controller
        
        vc.onClickSource = true
        
        vc.delegate = self
        
        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func destinationButtonTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "Table_View_controller") as! Table_View_controller
        
        vc.delegate = self

        
        present(vc, animated: true, completion: nil)
        
    }
    
    func reload(apiValu: Double) {

        DispatchQueue.main.async {

            if let price = self.valueEntered.text {

                if let p = Double(price) {

                   self.convertedValue.text = String( p * Double(apiValu))

                }
            }
        }
    }


}


extension ViewController: setData{
    
    func setData(data: String, onClickSource: Bool, onClickDestination: Bool) {
        
        if onClickSource == true{
            
            sourceButton.setTitle(data, for: .normal)
            
            if(destinationButtion.currentTitle != "Destination"){
                
                objectOfAPiCall.callApi(button1: sourceButton.currentTitle ?? "", button2: destinationButtion.currentTitle ?? "" ){ u in
                    
                    print(u)
                    self.reload(apiValu: u)
                }
                
               
                
            }
            
        }
        else{
            
            sourceButton.setTitle(data, for: .normal)
            
            if(destinationButtion.currentTitle != "Source"){
                
                objectOfAPiCall.callApi(button1: sourceButton.currentTitle ?? "", button2: destinationButtion.currentTitle ?? "" ){ u in
                    
                    print(u)
                    self.reload(apiValu: u)
                }
                
                
            }
            
        }
        
    }
    
}

