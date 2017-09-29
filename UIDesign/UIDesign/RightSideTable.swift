//
//  RightSideTable.swift
//  UIDesign
//
//  Created by Appinventiv Technologies on 29/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class RightSideTable: UITableViewCell {

    @IBOutlet weak var unCheckImage: UIImageView!
    @IBOutlet weak var rightDataLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
