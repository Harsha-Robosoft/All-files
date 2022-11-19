//
//  selectrorViewController.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 21/10/22.
//

import Foundation

import UIKit

class SelectorViewController: UIViewController {

    let games = [
        "Pacman",
        "Space Invaders",
        "Space Patrol",
    ]

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var containerStackView: UIStackView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var topAnchorConstraint: NSLayoutConstraint!

    var topAnchorValue: CGFloat

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
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
}
