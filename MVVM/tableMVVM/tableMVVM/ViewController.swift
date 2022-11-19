//
//  ViewController.swift
//  tableMVVM
//
//  Created by Harsha R Mundaragi on 02/11/22.
//

import UIKit

enum genderIs {
    case Male, Female
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var data = [PersonDetails(name: "Harsha", age: 33, gender: genderIs.Male),
                PersonDetails(name: "Pavan", age: 24, gender: genderIs.Male),
                PersonDetails(name: "Vini", age: 21, gender: genderIs.Male),
                PersonDetails(name: "Prajwal", age: 19, gender: genderIs.Male),
                PersonDetails(name: "Chiranjeevi", age: 28, gender: genderIs.Male)]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(customTableViewCell.nib(), forCellReuseIdentifier: customTableViewCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCell.cellIdentifier, for: indexPath) as! customTableViewCell
        
        let model = data[indexPath.row]
        let viewModel = CellViewModel(name: model.name, age: model.age)
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nameStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next = nameStoryboard.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
        self.navigationController?.pushViewController(next, animated: true)
    }
 
}


struct PersonDetails {
    let name: String
    let age: Int
    let gender: genderIs
}


struct CellViewModel{
    let name: String
    let age: Int
}
