//
//  menuItemCell.swift
//  SlidevC
//
//  Created by Macbook Pro on 30/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit

class menuItemCell: UITableViewCell {
    @IBOutlet weak var imageicon: UIImageView?
    @IBOutlet weak var itemName:UILabel? 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
