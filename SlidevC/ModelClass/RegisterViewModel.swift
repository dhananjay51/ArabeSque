//
//  RegisterViewModel.swift
//  ArabeSque
//
//  Created by DS on 16/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class RegisterViewModel: NSObject {
    var username: String = ""
    
    var useremail: String = ""
    var password: String = ""
    var confirmpassword: String = ""
    var checmaark: String = ""
    var completion: Completion?
    
    init(model: RegisterModel?) {
        if let mod = model {
            username = mod.username
            useremail = mod.useremail
            password = mod.password
            confirmpassword = mod.confirmPassword
            checmaark = mod.checkmark
        }   else
          {
             useremail = ""
             password = ""
        }

}
    //MARK:- Public Methods
    func SignUp(checkValidation: Bool, completion: @escaping Completion) {
        self.completion = completion
        if isValidrCredentials() {//Validate User inputs before hit web service
            RegisterRequeste()
          
        }
    }
    
    
    //MARK:- Private Methods
    
    
    //MARK:- Private Methods
    private func isValidrCredentials() -> Bool {
        
        if username.characters.count < 2  {
            completion!(Response.error(Alert.Message.nameNotValid))
            return false
        }
        if !useremail.isValidEmail() {
            completion!(Response.error(Alert.Message.emailNotValid))
            return false
        }

        if !password.isValidPassword() {
            completion!(Response.error(Alert.Message.enterValidPass))
            return false
        }
        
        if password != confirmpassword {
            completion!(Response.error(Alert.Message.confirmPassNotMatching))
            return false
        }
        
        //All Good
        return true
    }
   
    func RegisterRequeste(){
        
        let registerurl: String = APPURL.signUp //"http://api.goarabesque.com/api/User/Register"
        let registerdict: [String: String] = ["UserName":username, "Email":useremail,"Password":password,"ConfirmPassword": confirmpassword,"AgreeTermsChecked":checmaark]
         ServerHit.sharedInstance.PostApi(dict: registerdict, Url: registerurl) { (responseData,response)  in
            
            switch response {
            case .success:
                print(responseData)
                if responseData != nil {
                    if let json:JSON =  JSON(responseData)
                    {
                        if let dataStr = json["data"].string{
                            if dataStr == "" {
                                self.completion!(Response.success(Alert.Message.success))
                                
                            }else if dataStr == "EmailExistsActivationEmailResent"{
                                self.completion!(Response.success("Email Aleady Exists"))
                               
                            }
                        }
                    }
                }
            case .error(let msg):
               
                self.completion!(Response.error(msg))
            }
            
           
            }
        
    }
    
    }
