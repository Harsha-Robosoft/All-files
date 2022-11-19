//
//  TableViewCell.swift
//  ABC
//
//  Created by Harsha R Mundaragi on 10/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var gmailLabel: UILabel!
    
    
    func setData(data : PersonData) {
        nameLabel.text = data.name
        genderLabel.text = data.gender
        ageLabel.text = String(data.age)
        gmailLabel.text = data.gmail
    }

}
