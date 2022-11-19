//
//  FollowerVc.swift
//  assessmentTwitter
//
//  Created by Harsha R Mundaragi on 13/10/22.
//

import UIKit

class FollowerVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var peoples = [PeoplesDetails]()

    @IBOutlet weak var tableView2: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDetailsOfFollwer()
        tableView2.delegate = self
        tableView2.dataSource =  self

    }
    
    func setDetailsOfFollwer()
    {
        let person1 = PeoplesDetails(dp : #imageLiteral(resourceName: "GettyImages-501383115"),name : "Senna",atName : "@senna")
        peoples.append(person1)
        
        let person2 = PeoplesDetails(dp : #imageLiteral(resourceName: "3389edd6054cba3517b0c54a13d6b791"),name : "Vettal",atName : "@V5")
        peoples.append(person2)
        
        let person3 = PeoplesDetails(dp : #imageLiteral(resourceName: "1318341815.0"),name : "Messi",atName : "@LM10")
        peoples.append(person3)
        
        let person4 = PeoplesDetails(dp : #imageLiteral(resourceName: "0_GettyImages-1423320233"),name : "Ronsldo",atName : "@Cr7")
        peoples.append(person4)
        
        let person5 = PeoplesDetails(dp : #imageLiteral(resourceName: "202207290717-mobile.cropped_1659053838"),name : "Alanso",atName : "@A14")
        peoples.append(person5)
        
        let person6 = PeoplesDetails(dp : #imageLiteral(resourceName: "43951260_303"),name : "Danial",atName : "@D3")
        peoples.append(person6)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peoples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detailsIs = peoples[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! followTableViewCell
        cell.setDetails(detail : detailsIs)
        
        return cell
    }
    
    
    

}
