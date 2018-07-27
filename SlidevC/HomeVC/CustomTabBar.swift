//
//  CustomTabBar.swift
//  ArabeSque
//
//  Created by DS on 27/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {

    @IBInspectable var height: CGFloat = 0.0
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        if height > 0.0 {
            sizeThatFits.height = height
        }
        return sizeThatFits
    }

}
