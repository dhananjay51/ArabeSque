//
//  UIColor+Helper.swift
//  PixelApp
//
//  Created by IRCTC-ITC on 27/09/17.
//  Copyright © 2017 TechtreeIT. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct Blue {
        static let dark = UIColor.color(red: 25, green: 83, blue: 136, alpha: 1)
        static let light = UIColor.color(red: 99, green: 137, blue: 173, alpha: 1)
        static let shade = UIColor.color(red: 195, green: 226, blue: 255, alpha: 1)
        static let watterBlue = UIColor.color(red: 43, green: 186, blue: 233, alpha: 1)
        static let background = UIColor.color(red: 231, green: 242, blue: 254, alpha: 1)
        static let buttonBackground = UIColor.color(red: 0, green: 154, blue: 215, alpha: 1)
    }
    struct Red {
        static let dark = UIColor.color(red: 234, green: 45, blue: 103, alpha: 1)
    }
    struct Yellow {
        //static let dark = UIColor.color(red: 253, green: 212, blue: 23, alpha: 1)
        static let darkShade = UIColor.color(red: 253, green: 212, blue: 23, alpha: 0.6)
    }
    
    
    struct Green {
        //static let dark = UIColor.color(red: 253, green: 212, blue: 23, alpha: 1)
        
        static let darkShade = UIColor.green.withAlphaComponent(0.5)
    }
    
    
    struct Black {
        static let dark = UIColor.color(red: 32, green: 32, blue: 32, alpha: 1)
    }
    struct Gray {
        static let dark = UIColor.color(red: 121, green: 121, blue: 121, alpha: 1)
        static let light = UIColor.color(red: 226, green: 226, blue: 226, alpha: 1)
    }
    
    static func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    
    class func color(withData data:Data) -> UIColor {
        return NSKeyedUnarchiver.unarchiveObject(with: data) as! UIColor
    }
    
    
    func encodeColor() -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: self)
    }
    
    
}
