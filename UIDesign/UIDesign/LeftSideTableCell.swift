//
//  LeftSideTableCell.swift
//  UIDesign
//
//  Created by Appinventiv Technologies on 29/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class LeftSideTableCell: UITableViewCell {

   
    @IBOutlet weak var regionDataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
