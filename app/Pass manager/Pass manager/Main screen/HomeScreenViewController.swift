//
//  mainScreenVc.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 17/10/22.
//

import UIKit

class HomeScreenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    
    static var objectOfHomeScreenViewController = HomeScreenViewController()
    
    @IBOutlet weak var pro: UIBarButtonItem!
    
    @IBOutlet weak var cardtable: UITableView!
        
    @IBOutlet weak var socielmediaCount: UILabel!
    
    @IBOutlet weak var cardtableView: UITableView!
    
    @IBOutlet weak var socialMediaCount: UILabel!
    
    @IBOutlet weak var selectedFolderName: UILabel!
    
    @IBOutlet weak var underLine: UILabel!
    
    @IBOutlet weak var dataSync: UIView!
    
    @IBOutlet weak var cardViewCell: UIView!
    
    var mobileNumber: String = ""
    
    var currentUser: UserDetails!
    
    var filterSearchItems = [UserData]()
    
    var searchController = UISearchController()

    var searchBar = UISearchBar()
    
    private let floatingButtion: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        button.layer.masksToBounds = true
        
        button.layer.cornerRadius = 30
        
        
        button.backgroundColor = .systemBlue
        
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        
        button.setImage(image, for: .normal)
        
        button.tintColor = .white
        
        button.setTitleColor(.white, for: .normal)
        
        button.layer.shadowRadius = 10
        
        button.layer.shadowOpacity = 0.3
        
        button.layer.cornerRadius = 30
        
        return button
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = false
        
        filterSearchItems = currentUser.details

        cardtable.reloadData()
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        dataSync.isHidden = true
            
        self.navigationItem.hidesBackButton = true
        
        socielmediaCount.layer.masksToBounds = true
        
        socielmediaCount.layer.cornerRadius = 15.5
        
        underLine.layer.masksToBounds = true

        underLine.layer.cornerRadius = 2.0
        
        cardtable.delegate = self
        
        cardtable.dataSource = self
        
        view.addSubview(floatingButtion)
        
        floatingButtion.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("users.txt")
 
                do {
                    
                   let data = try Data(contentsOf: path)

                   if let value = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [UserDetails] {

                    users = value

                   }

                } catch {

                print("ERROR: \(error.localizedDescription)")

                }

                var f = 0

                for user in users{

                    if(user.mobileNumber == mobileNumber){

                        currentUser = user

                        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(user.mobileNumber+".txt")
                        
                        do {

                           let data = try Data(contentsOf: path)

                           if let value = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [UserData] {

                            currentUser.details = value

                            print(users[0].mobileNumber)
                            
                           }

                        } catch {

                        print("ERROR: \(error.localizedDescription)")

                        }

                        cardtableView.reloadData()

                        f = 1

                        break
                        
                    }

                }

                if(f == 0){

                    let newUser = UserDetails(mobileNumber: mobileNumber)

                    currentUser = newUser

                    users.append(newUser)

                    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("users.txt")

                    do {

                        let data = try NSKeyedArchiver.archivedData(withRootObject: users, requiringSecureCoding: false)

                    try data.write(to: path)

                    } catch {

                    print("ERROR: \(error.localizedDescription)")
                        
                    }
                    
                }
        
        filterSearchItems = currentUser.details
        
        if(filterSearchItems.count == 0){

            socielmediaCount.text =  String(filterSearchItems.count)

        }
        
        else if(currentUser.details.count <= 9){

            socielmediaCount.text = "0" + String(filterSearchItems.count)

        }

        else{

            socielmediaCount.text =  String(filterSearchItems.count)

        }
        
        cardtable.reloadData()
        
        }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        floatingButtion.frame = CGRect(x: view.frame.size.width - 70 , y: view.frame.size.height - 100, width: 60, height: 60)
        
    }
    
    @objc private func didTapButton() {
        
        _ = UIStoryboard(name: "Main", bundle: nil)
//
//        let adddSiteVc = self.storyboard?.instantiateViewController(withIdentifier: "addSiteVc") as! AddSiteViewController
//
//        self.navigationController?.pushViewController(adddSiteVc, animated: true)
//
//        let newData = UserData(url: "", siteName: "", userName: "", sector: "", password: "", note: "")
//
//        adddSiteVc.userDelegate = newData
//
//        adddSiteVc.homeDelegate = self
//
//        self.currentUser.details.append(newData)
        
        let adddSiteVc = self.storyboard?.instantiateViewController(withIdentifier: "MultipleScreenViewController") as! MultipleScreenViewController
        
        adddSiteVc.bringView()
        
        adddSiteVc.editHide()

        self.navigationController?.pushViewController(adddSiteVc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if currentUser != nil{

            return  filterSearchItems.count

        }

        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = cardtableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeScreenTableViewCell

        let detail = filterSearchItems[indexPath.row]

        cell.name.text = detail.siteName

        cell.urltext.text = detail.url

        cell.setData(cell: cell, indexPath: indexPath)

        cell.password = detail.password
        
        cell.setcardView()
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        cardtableView.deselectRow(at: indexPath, animated: true)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let details = filterSearchItems[indexPath.row]
//
//        let nameStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let next = nameStoryboard.instantiateViewController(withIdentifier: "setDetailsVc") as! SiteDetailViewController
//
//        next.details = details
//
//        next.home = self
//
//        self.navigationController?.pushViewController(next, animated: true)
        
        let adddSiteVc = self.storyboard?.instantiateViewController(withIdentifier: "MultipleScreenViewController") as! MultipleScreenViewController
        
        adddSiteVc.editTitleBar.title = "Site Details"
        
        adddSiteVc.editEnable()
        
        adddSiteVc.hideUpdateAndSaveRest()

        self.navigationController?.pushViewController(adddSiteVc, animated: true)

    }
    
    
    @IBAction func search(_ sender: Any) {
        
        searchController = UISearchController(searchResultsController: nil)

        searchController.hidesNavigationBarDuringPresentation = false

        searchController.searchBar.keyboardType = UIKeyboardType.asciiCapable

        self.searchController.searchBar.delegate = self

        present(searchController, animated: true, completion: nil)

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            filterSearchItems = []

            if(searchText ==  "" || searchText.isEmpty) {

                filterSearchItems = currentUser.details

                cardtable.reloadData()

            }

            else{

            for detail in currentUser.details{

                if(detail.siteName.lowercased().contains(searchText.lowercased())){
                    
                    filterSearchItems.append(detail)

                }

            }

            self.cardtable.reloadData()

            }

    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

        filterSearchItems = currentUser.details

        cardtable.reloadData()

    }
    
    
    
    
    @IBAction func presentModal(_ sender: Any) {
        
        let topAnchorValue = UIScreen.main.bounds.height * 0.5
        
        let vc = SelectorViewController(topAnchorValue: topAnchorValue)
        
        vc.modalPresentationStyle = .overCurrentContext
        
        present(vc, animated: true, completion: nil)
        
        vc.folders.append("All Sites")
        
        vc.eddVcObject = self
        
    }
    
    @IBAction func dataSyncButton(_ sender: Any) {
        
        dataSync.isHidden = false

        floatingButtion.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            
        self.floatingButtion.isEnabled = true

        self.dataSync.isHidden = true
            
        }
    
    }

}

extension HomeScreenViewController : SavingData,GetFolderName {
    
    func folderName(data: String) {
        
        if(data == "All Sites"){

            filterSearchItems = currentUser.details

            if(filterSearchItems.count == 0){

                socielmediaCount.text =  String(filterSearchItems.count)

            }

            else if(currentUser.details.count <= 9){

                socielmediaCount.text = "0" + String(filterSearchItems.count)

            }

            else{

                socielmediaCount.text =  String(filterSearchItems.count)

            }
            
            cardtable.reloadData()

        }

        else{

            filterSearchItems = currentUser.details.filter({ $0.sector == data})

            if(filterSearchItems.count == 0){

                socielmediaCount.text =  String(filterSearchItems.count)

            }

            else if(currentUser.details.count <= 9){

                socielmediaCount.text = "0" + String(filterSearchItems.count)

            }

            else{

                socielmediaCount.text =  String(filterSearchItems.count)

            }

            cardtable.reloadData()

        }
        
        selectedFolderName.text = data
        
        selectedFolderName.reloadInputViews()
        
    }

    func saveData() {

        currentUser.details = currentUser.details.filter({ $0.url != ""})
        
        if(currentUser.details.count == 0){

            socielmediaCount.text =  String(currentUser.details.count)

        }

        else if(currentUser.details.count <= 9){

            socielmediaCount.text = "0" + String(currentUser.details.count)

        }

        else{

            socielmediaCount.text =  String(currentUser.details.count)

        }
        
        self.cardtableView.isHidden = false

        self.cardtableView.reloadData()
        
    }

    func reload(){
            
        floatingButtion.isEnabled = true
        
        if(currentUser.details.count == 0){

            socielmediaCount.text =  String(currentUser.details.count)

        }

        else if(currentUser.details.count <= 9){

            socielmediaCount.text = "0" + String(currentUser.details.count)

        }

        else{

            socielmediaCount.text =  String(currentUser.details.count)

        }
            
        currentUser.details = currentUser.details.filter({ $0.url != ""})
            
        cardtable.reloadData()
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(currentUser.mobileNumber+".txt")

            do{

                let data = try NSKeyedArchiver.archivedData(withRootObject: currentUser.details, requiringSecureCoding: false)

                try data.write(to: path)

            }
            
            catch{

                    print("ERROR: \(error.localizedDescription)")
                        
            }
            
    }
        
}




