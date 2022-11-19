//
//  ViewController.swift
//  Text field delegates
//
//  Created by Harsha R Mundaragi on 23/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
    }
    
    private func configureTapGesture (){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap()  {
        print("Handle tap was called")
        view.endEditing(false)
    }
    
    private func configureTextFields(){
        textField1.delegate = self
        textField2.delegate = self
    }
    
    
    @IBAction func logInTapped(_ sender: Any) {
        view.endEditing(true)
    }
    

}


extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
