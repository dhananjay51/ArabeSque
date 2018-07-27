//
//  EventCategoryCell.swift
//  ArabeSque
//
//  Created by DS on 23/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class EventCategoryCell: UITableViewCell {
    @IBOutlet weak var Category: SkyFloatingLabelTextField!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
