//
//  myTweetVc.swift
//  assessmentTwitter
//
//  Created by Harsha R Mundaragi on 13/10/22.
//

import UIKit

class myTweetVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource =  self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myPost = posts[indexPath.row]
        let mydetails = tableView.dequeueReusableCell(withIdentifier: "cell3") as! myTweetTableViewCell
        mydetails.setMyData(data : myPost)
        
        return mydetails
    }

}
