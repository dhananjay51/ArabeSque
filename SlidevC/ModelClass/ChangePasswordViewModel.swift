//
//  ChangePasswordViewModel.swift
//  ArabeSque
//
//  Created by DS on 31/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
 import SwiftyJSON


class ChangePasswordViewModel: NSObject {
    
    var Oldpassword: String?
    var NewPassword: String?
    var ConfirmNewPassword: String?
    var completion: Completion?
    init(model: ChangePasswordModel?) {
        if let mod = model {
            Oldpassword = mod.OldPassword
            NewPassword = mod.NewPassword
            ConfirmNewPassword = mod.ConfirmNewPassword
           }
        
        else
        {
            Oldpassword = ""
            NewPassword = ""
            ConfirmNewPassword = ""
        }
    }
    func changePassword(completion: @escaping Completion) {
        
        self.completion = completion
        if isValidrCredentials() {//Validate User inputs before hit web service
            changePasswordRequeste()
        }
    }
    private func isValidrCredentials() -> Bool {
        
        if (Oldpassword == nil) {
            completion!(Response.error(Alert.Message.enterCorrectPass))
            return false
        }
        
        else if NewPassword == nil || !(NewPassword?.isValidPassword())! {
            completion!(Response.error(Alert.Message.enterValidPass))
            return false
        }else if ConfirmNewPassword == nil || ConfirmNewPassword! != NewPassword {
            completion!(Response.error(Alert.Message.confirmPassNotMatching))
            return false
        }
        //All Good
        return true
    }
    func  changePasswordRequeste()  {
        
      let loginurl: String = APPURL.ChangePasswordUrl + "T=3046"
        let logindict: [String: String] = ["OldPassword":self.Oldpassword!,"NewPassword":self.NewPassword!]
    ServerHit.sharedInstance.PostApi(dict: logindict, Url: loginurl) { (responseData, response)  in
    
    switch response {
    case .success:
    print(responseData)
    if responseData != nil {
    if let json:JSON =  JSON(responseData)
    {
    /// if let datadict = json["data"].dictionary{
    let status = json["Status"].int
    if (status==1) {
    self.completion!(Response.success(json["Message"].stringValue))
    
    }
    else {
    
    self.completion!(Response.success(json["Message"].stringValue))
    }
    }
    else{
    self.completion!(Response.error("NotFound"))
    }
    }
    
    case .error(let msg):
    
    self.completion!(Response.error(msg))
    }
    
    ///self.completion!(Response.error("NotFound"))
    }
    
}
}


