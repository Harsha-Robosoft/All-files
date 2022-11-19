//
//  customTableViewCell.swift
//  tableMVVM
//
//  Created by Harsha R Mundaragi on 02/11/22.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet var myLable: UILabel!
    
    static let cellIdentifier = "customTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    static func nib() -> UINib{
        return UINib(nibName: "customTableViewCell", bundle: nil)
    }
    
    public func configure(with viewMOdel: CellViewModel){
        myLable.text = "\(viewMOdel.name) \(viewMOdel.age)"
    }
    
}
