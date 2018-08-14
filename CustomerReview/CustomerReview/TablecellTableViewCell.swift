//
//  TablecellTableViewCell.swift
//  CustomerReview
//
//  Created by MacStudent on 2018-08-11.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class TablecellTableViewCell: UITableViewCell {
    @IBOutlet weak var imgtable: UIImageView!
    
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lbldes: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
