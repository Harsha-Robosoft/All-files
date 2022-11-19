//
//  addViewController.swift
//  Table view data sending
//
//  Created by Harsha R Mundaragi on 10/10/22.
//

import UIKit

class mainVC: UIViewController{
    
    
    var dataCollection = [PersonData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addbutton(_ sender: Any) {
        
        let dataVc = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        
        let person1 = PersonData(name: "", gender: "", age: 0, gmail: "")
        dataCollection.append(person1)
        
        dataVc.delegate = self
        dataVc.currentObject = person1
        
        
        self.navigationController?.pushViewController(dataVc, animated: true)
    }
    

}

extension mainVC : sendData {
    func details(name: String, gender: String, age: Int, gmail: String) {
        
    }
    
    
}

extension mainVC : UITabBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return dataCollection.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    
//    }
    
    
}


