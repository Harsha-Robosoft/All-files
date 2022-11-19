//
//  ViewController.swift
//  Table view
//
//  Created by Harsha R Mundaragi on 03/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    let name = ["Harsha","Prajwal","Santhosh","Jeegu","Vini"]
    
    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableVIew.delegate = self
        tableVIew.dataSource = self
    }


}


extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hit..!")
    }
}


extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
        cell.textLabel?.text = name[indexPath.row]
        return cell
    }
}
