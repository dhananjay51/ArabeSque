//
//  EducationCell.swift
//  ArabeSque
//
//  Created by DS on 25/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class EducationCell: UITableViewCell {
     @IBOutlet weak var Qualicfication :SkyFloatingLabelTextField!
     @IBOutlet weak var Uiniversity :SkyFloatingLabelTextField!
     @IBOutlet weak var From :SkyFloatingLabelTextField!
     @IBOutlet weak var To :SkyFloatingLabelTextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
