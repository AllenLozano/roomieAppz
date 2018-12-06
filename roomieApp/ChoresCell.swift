//
//  ChoresCell.swift
//  roomieApp
//
//  Created by Allen Lozano on 12/5/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit

class ChoresCell: UITableViewCell {
    
    @IBOutlet weak var choreLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    
    var indexPath : IndexPath?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
