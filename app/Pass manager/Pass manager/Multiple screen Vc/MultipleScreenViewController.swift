//
//  MultipleScreenViewController.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 08/11/22.
//

import UIKit

class MultipleScreenViewController: UIViewController {
    

    @IBOutlet weak var resetButton: UIButton?
    
    @IBOutlet weak var saveButton: UIButton?
    
    @IBOutlet weak var edit: UIBarButtonItem!
    
    @IBOutlet var customView: MultipleScreenFile!
    
    @IBOutlet weak var saveAndResetView: UIView?
    
    @IBOutlet weak var updateView: UIView?
    
    @IBOutlet weak var editTitleBar: UIBarButtonItem!
    
    @IBOutlet weak var updateButton: UIButton?
    
    @IBOutlet weak var whiteView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customView.drop = showModaly

    }

    @IBAction func backButton(_ sender: Any){
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    func bringView() {
        view.bringSubviewToFront(saveAndResetView!)
    }
    
    func bringUpdate() {
        view.bringSubviewToFront(updateView!)
    }
    
    func hideUpdateAndSaveRest()  {
        
        view.bringSubviewToFront(whiteView)
        
    }
    
    func editHide() {
        
        edit.isEnabled = false
        
        edit.title = " "
    }
    
    func editEnable() {
        
        edit.isEnabled = true
                
    }
    
    
    @IBAction func edit(_ sender: Any){
        
        let adddSiteVc = self.storyboard?.instantiateViewController(withIdentifier: "MultipleScreenViewController") as! MultipleScreenViewController
        
        adddSiteVc.bringUpdate()
        
        adddSiteVc.editTitleBar.title = "Edit"
        
        adddSiteVc.editHide()
        
        self.navigationController?.pushViewController(adddSiteVc, animated: true)
        
    }
    
    
    func showModaly() {
        
        let topAnchorValue = UIScreen.main.bounds.height * 0.5
        
        let vc = SelectorViewController(topAnchorValue: topAnchorValue)
        
        vc.modalPresentationStyle = .overCurrentContext
        
        present(vc, animated: true, completion: nil)
        
    }
}
