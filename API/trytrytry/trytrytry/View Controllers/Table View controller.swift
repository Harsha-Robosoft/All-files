//
//  Table View controller.swift
//  trytrytry
//
//  Created by Harsha R Mundaragi on 17/11/22.
//

import UIKit

protocol setData{

    func setData(data: String, onClickSource: Bool, onClickDestination: Bool)

}

class Table_View_controller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: setData?
    
    var onClickSource = false

    var onClickDestination = false
    
    @IBOutlet weak var tableView: UITableView!
    
    var objectOfData = Data()

    
    var objectOfViewController = ViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(objectOfData.codeData.capacity)
        
        tableView.delegate = self

        tableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectOfData.codeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.codeLabel.text = objectOfData.codeData[indexPath.row]
        cell.nameLabel.text = objectOfData.nameData[indexPath.row]

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if onClickSource{

            delegate?.setData(data: objectOfData.codeData[indexPath.row], onClickSource: true, onClickDestination: false)

        }

        else{

            delegate?.setData(data: objectOfData.codeData[indexPath.row], onClickSource: false, onClickDestination: true)

        }

            self.dismiss(animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true)
    }
}
