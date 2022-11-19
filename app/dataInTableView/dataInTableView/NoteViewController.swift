//
//  NoteViewController.swift
//  dataInTableView
//
//  Created by Harsha R Mundaragi on 03/10/22.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var noteLabel: UITextView!
    
    public var noteTitle : String = ""
    public var note : String = "" 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textlabel.text = noteTitle
        noteLabel.text = note
    }
    

   

}
