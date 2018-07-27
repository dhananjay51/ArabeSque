//
//  menuCell.swift
//  ArabeSque
//
//  Created by Macbook Pro on 03/04/1940 Saka.
//  Copyright © 1940 Macbook Pro. All rights reserved.
//

import UIKit

class menuCell: UICollectionViewCell {
    @IBOutlet weak var menubtn:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        menubtn.backgroundColor = .clear
        menubtn.layer.cornerRadius = 5
        menubtn.layer.borderWidth = 1
        menubtn.layer.borderColor = UIColor.lightGray.cgColor
        // Initialization code
    }

}
