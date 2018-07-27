//
//  String+Validater.swift
//  Maisonette
//
//  Created by IRCTC-ITC on 01/11/17.
//  Copyright © 2017 Rohit. All rights reserved.
//

import UIKit

extension String {
    
    struct ValidRange {
        static let maxPasswordLength = 14
        static let minPasswordLength = 1
    }

    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: characters.count)) != nil
    }
    
    
    
//    func isValidPhoneNumber() -> Bool {
//        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
//        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
//        let result =  phoneTest.evaluate(with: self)
//        return result
//    }

    func isValidPhoneNumber() -> Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func isValidPassword() -> Bool {
        if self.characters.count >= ValidRange.minPasswordLength && self.characters.count <= ValidRange.maxPasswordLength {
            return true
        }else{
            return false
        }
    }
    
    func getFirstCharater() -> String {
        let index = self.characters.index(self.startIndex, offsetBy: 0)
        let startChar = self[index]
        return String(startChar)
    }
  
    
}
