//
//  RegisterModel.swift
//  ArabeSque
//
//  Created by DS on 16/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class RegisterModel: NSObject {
    var username :String
    var useremail: String
    var password: String
    var confirmPassword:String
    var checkmark :String
    
     override init() {
         username = ""
         useremail = ""
         password = ""
         confirmPassword = ""
         checkmark = ""
    }

}
