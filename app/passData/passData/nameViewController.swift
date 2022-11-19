//
//  nameViewController.swift
//  passData
//
//  Created by Harsha R Mundaragi on 28/09/22.
//

import UIKit

class nameViewController: UIViewController {

    @IBOutlet weak var nameLable: UILabel!
    var finalName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLable.text = finalName

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
