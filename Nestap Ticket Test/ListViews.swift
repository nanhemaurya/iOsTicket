//
//  TableViewCell.swift
//  Nestap Ticket Test
//
//  Created by SNMBoy on 22/10/20.
//

import UIKit

class ListViews: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleRef: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
