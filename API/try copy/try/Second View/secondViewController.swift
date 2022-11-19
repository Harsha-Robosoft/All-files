//
//  secondViewController.swift
//  try
//
//  Created by Harsha R Mundaragi on 15/11/22.
//

import UIKit

class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    typealias completionHandler = ([String:Any]) -> Void
    
    @IBOutlet weak var tableView: UITableView!
    
    var object1 = CuntryAndCuntryCode()
    
    var onClickSource = false
    
    var onClickDestination = false
    
    var completion: completionHandler?
    
    let objectOfViewMOdel = SecondViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        objectOfViewMOdel.callApiWithViewModel(){ a in
            
            if let x = a.countryData["description"]{
                self.object1.nameData.append(x)
            }
            
            if let y = a.countryData["code"]{
                self.object1.codeData.append(y)
            }
            
        } fail: { err in
            
            print(err)
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object1.nameData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.code.text = object1.codeData[indexPath.row]
        cell.name.text = object1.nameData[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if onClickSource{
            
            var dict = ["a": String(indexPath.row), "b": true, "c": false] as? [String : Any] ?? ["" : ""]
            
            print("(((()))))",dict["a"])

            guard let completionBlock = completion else { return }
            completionBlock(dict)
            

        }
        
        else{
            
            print("******")
            var dict = ["a": String(indexPath.row), "b": false, "c": true] as? [String : Any] ?? ["" : ""]
            
            guard let completionBlock = completion else { return }
            completionBlock(dict)
            
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
