//
//  mainVc.swift
//  ABC
//
//  Created by Harsha R Mundaragi on 10/10/22.
//

import UIKit


var dataCollection = [PersonData]()

class mainVc: UIViewController, sendData{
    
    
    
    
    @IBOutlet weak var table: UITableView!
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    func details(name: String, gender: String, age: Int, gmail: String) {
        tableView.reloadData()
            }
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("values.txt")
        do {
            
            let data = try Data(contentsOf:  path)
        if let value = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [PersonData] {
        print(value)
        dataCollection = value
            table.reloadData()
            
        }
        } catch {
        print("error: \(error.localizedDescription)")
        
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let details = dataCollection[indexPath.row]
        let nameStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let next = nameStoryBoard.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        next.title = "Edit"
        next.receiveData = self
        next.currentObject = details
        self.navigationController!.pushViewController(next, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataCollection.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        let secVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        

        let person1 = PersonData(name: "", gender: "", age: "", gmail: "")
        dataCollection.append(person1)
        
        secVC.receiveData = self
        
        secVC.currentObject = person1

        
        self.navigationController?.pushViewController(secVC, animated: true)
        
    }
    
}


extension mainVc : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataCollection[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! TableViewCell
        
        cell.setData(data: data)
        
        return cell
    }
    
    
} 
