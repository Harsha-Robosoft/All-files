//
//  secondViewController.swift
//  PassDataInTwoDirection
//
//  Created by Harsha R Mundaragi on 28/09/22.
//

import UIKit

protocol passDataToVC {
    func passdata(str: String)
}
class secondViewController: UIViewController {
    @IBOutlet weak var textField2: UITextField!
    
    var data = ""
    var delegate : passDataToVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField2.text = data
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button2(_ sender: Any) {
        delegate.passdata(str: textField2.text!)
        navigationController?.popViewController(animated: true)
    }
    
   

}
