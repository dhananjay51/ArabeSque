//
//  GroupCategoryCell.swift
//  ArabeSque
//
//  Created by DS on 27/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class GroupCategoryCell: UITableViewCell {
    @IBOutlet weak var SelectCategory:SkyFloatingLabelTextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
