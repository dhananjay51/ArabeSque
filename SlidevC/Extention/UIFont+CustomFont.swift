//
//  UIFont+CustomFont.swift
//  Maisonette
//
//  Created by Rohit Sisodia on 17/12/17.
//  Copyright © 2017 Rohit. All rights reserved.
//

import UIKit

extension UIFont {
    
    struct Raleway {
        static func bold(size: CGFloat) -> UIFont {
            return UIFont(name: "Raleway-Bold", size: size)!
        }
        static func Regular(size: CGFloat) -> UIFont {
            return UIFont(name: "Raleway-Regular", size: size)!
        }
    }
    
    struct Roboto
    {
        static func bold(size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Bold", size: size)!
        }
        static func Regular(size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Regular", size: size)!
        }
        static func Italic(size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Italic", size: size)!
        }
    }
}
