//
//  mainVc.swift
//  assessmentTwitter
//
//  Created by Harsha R Mundaragi on 12/10/22.
//

import UIKit

var posts = [Tweet]()


class mainVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let logo = UIImage(named: "twitter_logo_small.png")
        self.navigationItem.titleView = UIImageView(image: logo)
        
        setPost()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setPost()
    {
        let object1 = Tweet(logo: #imageLiteral(resourceName: "download.svg"), name: "F1", userName: "#F1", hashtag:"#Nodiswaminaavirodeheege", message: "Although Vettel last year signed a deal to stay at Red Bull until the end of 2015, it is believed his lowly position in this year's world championship triggered an exit clause that allowed him to leave. On one hand is a team that wants him — and had the cash to prove it; on the other, a team that no longer needs him", post: #imageLiteral(resourceName: "Ferrari-1200-1-1024x683.svg"))
        
        let object2 = Tweet(logo: #imageLiteral(resourceName: "Cricket_India_Crest.svg (1)"), name: "BCCi", userName: "#BCCi", hashtag:"#Talaiwa", message: "Harbhajan Singh announced his retirement on December 24 ending an 18-year long career. He finished with 711 wickets across formats from 367 international games for India.", post: #imageLiteral(resourceName: "download-1"))
        posts.append(object1)
        posts.append(object2)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! TableViewCell
        cell.setData(post : post)
        
        return cell
    }


}
