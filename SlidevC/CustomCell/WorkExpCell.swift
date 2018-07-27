//
//  WorkExpCell.swift
//  ArabeSque
//
//  Created by DS on 25/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class WorkExpCell: UITableViewCell {
    @IBOutlet weak var companyanme :SkyFloatingLabelTextField!
    @IBOutlet weak var Destination :SkyFloatingLabelTextField!
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
