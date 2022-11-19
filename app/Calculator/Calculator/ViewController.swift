//
//  ViewController.swift
//  Calculator
//
//  Created by Harsha R Mundaragi on 21/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var finalValueLdl: UILabel!
    @IBOutlet weak var number1Text: UITextField!
    @IBOutlet weak var operationText: UITextField!
    @IBOutlet weak var number2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalValueLdl.text = ""
    }

    @IBAction func calculate(_ sender: Any)
    {
        let num1 = Double(number1Text.text!)!
        let num2 = Double(number2Text.text!)!
        let opr = operationText.text!
    
        let total : Any
        
        switch opr {
        case "+":
            total = num1 + num2
        case "-":
            total = num1 - num2
        case "*":
            total = num1 * num2
        case "/":
            total = num1 / num2
        default:
            total = "Please enter a valid operation...!"
        }
        
        finalValueLdl.text = "\(total)"
    }
    
    
}

