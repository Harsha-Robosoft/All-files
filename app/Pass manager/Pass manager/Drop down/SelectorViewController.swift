//
//  SelectorViewController.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 24/10/22.
//

import UIKit

protocol GetFolderName {
    
    func folderName(data: String)
    
}

class SelectorViewController: UIViewController {

    var folders = ["Social Media","Entertainment","Sports","News","Online Payment"]

    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet var containerStackView: UIStackView!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var topAnchorConstraint: NSLayoutConstraint!

    var topAnchorValue: CGFloat
    
    var eddVcObject: GetFolderName!

    init(topAnchorValue: CGFloat) {
        
        self.topAnchorValue = topAnchorValue
        
        super.init(nibName: nil, bundle: nil)
        
    }

    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        tableView.delegate = self
        
        tableView.dataSource = self
        
    }

    @IBAction func cancelTapped(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
}

extension SelectorViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = folders[indexPath.row]
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return folders.count
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        eddVcObject?.folderName(data: folders[indexPath.row])

        dismiss(animated: true, completion: nil)

    }
    
}
