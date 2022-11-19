//
//  ViewController.swift
//  First App
//
//  Created by Harsha R Mundaragi on 21/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceTxt: UITextField!
    
    @IBOutlet weak var taxTxt: UITextField!
    
    @IBOutlet weak var totlepriceLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totlepriceLbl.text = ""
    }

    @IBAction func  calculateTotlePrice(_ sender: Any) {
        let price = Double(priceTxt.text!)!
        let tax = Double(taxTxt.text!)!
        
        let taxPrice = price * tax
        let totlePrice = price + taxPrice
        
        totlepriceLbl.text = "\(totlePrice)"
    }
    
}

