//
//  DetailTableViewCell.swift
//  footballManager
//
//  Created by Lab on 3.06.2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
