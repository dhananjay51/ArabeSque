//
//  LoginViewModel.swift
//  ArabeSque
//
//  Created by DS on 17/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewModel: NSObject {
    var useremail: String = ""
    var password: String = ""
    var checmaark: String = ""
    var completion: Completion?
    
    
    init(model: LoginModel?) {
        if let mod = model {
           
            useremail = mod.useremail
            password = mod.password
          
            checmaark = mod.checkmark
        }   else
        {
            useremail = ""
            password = ""
        }
        
    }
    //MARK:- Public Methods
    func signIn(checkValidation: Bool, completion: @escaping Completion) {
        self.completion = completion
        if !checkValidation || isValidrCredentials() {//Validate User inputs before hit web service
            loginRequeste()
        }
    }
    private func isValidrCredentials() -> Bool {
        
        if !useremail.isValidEmail()   {
            completion!(Response.error(Alert.Message.usernameNotValid))
            return false
        }
        if !password.isValidPassword() {
            completion!(Response.error(Alert.Message.enterValidPass))
            return false
        }
        
        //All Good
        return true
    }
    
    func loginRequeste(){
        
        let loginurl: String = APPURL.signIn
        let logindict: [String: String] = ["UserEmail":useremail,"UserPassword":password,"AgreeTermsChecked":checmaark]
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
