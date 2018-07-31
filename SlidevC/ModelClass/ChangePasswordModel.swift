//
//  ChangePasswordModel.swift
//  ArabeSque
//
//  Created by DS on 31/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ChangePasswordModel: NSObject {
    var OldPassword: String
    var NewPassword:String
    var ConfirmNewPassword:String
    
    override init() {
        
        OldPassword = ""
        NewPassword = ""
        ConfirmNewPassword=""
    }
}
