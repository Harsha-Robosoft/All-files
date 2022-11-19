//
//  CountryListViewController.swift
//  Currency converter
//
//  Created by Harsha R Mundaragi on 10/11/22.
//

import UIKit

protocol setData{

    func setData(data: String, onClickSource: Bool, onClickDestination: Bool)

}


class CountryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    var delegate: setData?
    
    var onClickSource = false

    var onClickDestination = false
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var code = [String]()
    
    var name = [String]()
    
    var rates = [Double]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select Country"

        tableView.delegate = self
        
        tableView.dataSource = self
        
        APIService.shareInstance.getAllCountryData{(result, error) in
            
            if error == nil{
                
                if let a  = result?.symbols {

                   

                           for key in  a{

                            self.code.append(String(key.key))

                            self.name.append(String(key.value.description))

                           }

                       }
                
                
            }
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  code.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.code.text = code[indexPath.row]
        
        cell.name.text = name[indexPath.row]

        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if onClickSource{

            delegate?.setData(data: code[indexPath.row], onClickSource: true, onClickDestination: false)

        }

        else{

            delegate?.setData(data: code[indexPath.row], onClickSource: false, onClickDestination: true)

        }

            self.dismiss(animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true)

    }
        
        
        
        
}
    

    
    

    

