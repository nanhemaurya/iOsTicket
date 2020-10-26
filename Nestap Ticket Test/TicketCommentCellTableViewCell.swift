//
//  TicketCommentCellTableViewCell.swift
//  Nestap Ticket Test
//
//  Created by SNMBoy on 26/10/20.
//

import UIKit

class TicketCommentCellTableViewCell: UITableViewCell {
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var commentDate: UILabel!
    @IBOutlet weak var commentedName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
