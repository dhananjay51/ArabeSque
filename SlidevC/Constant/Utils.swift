//
//  Utils.swift
//  TESTING
//
//  Created by Kumar San on 19/03/18.
//  Copyright © 2018 Kumar San. All rights reserved.
//

import UIKit

class Utils: NSObject {
    static  func heightForLabel(text:String, font:UIFont, width:CGFloat) -> CGFloat
    {
        let label:UILabel = UILabel(frame: CGRect(x:0, y:0, width:width, height:CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
        
    }
}
