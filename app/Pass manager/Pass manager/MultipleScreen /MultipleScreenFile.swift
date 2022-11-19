//
//  MultipleScreenFile.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 08/11/22.
//

import UIKit

class MultipleScreenFile: UIView{

    @IBOutlet weak var urlText: UITextField!
    
    @IBOutlet weak var siteName: UITextField!
    
    @IBOutlet weak var sectorFolderText: UITextField!
    
    @IBOutlet weak var userNameTxt: UITextField!
    
    @IBOutlet weak var setPasswordText: UITextField!
    
    @IBOutlet weak var noteText: UITextField!
    
    var drop: (()->Void)!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
        
    }
    
    func viewInit() {
        
        let xibView = Bundle.main.loadNibNamed("MuitipleScreen", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
    
    
    @IBAction func dropDown(_ sender: Any) {
        
        drop()
        
    }
    
}

