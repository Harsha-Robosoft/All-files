//
//  ViewController.swift
//  dataInTableView
//
//  Created by Harsha R Mundaragi on 03/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var label: UILabel!
    
    var models : [(title : String ,note : String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.delegate = self
        table.dataSource = self
        title = "Note"
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else{
            return
        }
        vc.title = "note"
        vc.noteTitle = model.title
        vc.note = model.note

        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated : true)
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
            return  }
        
        vc.title = "New note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle ,note in
            self.navigationController?.popViewController(animated: true)
            self.models.append((title : noteTitle ,note : note))
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

