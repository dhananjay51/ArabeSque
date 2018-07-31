//
//  ForgotPasswordViewModel.swift
//  ArabeSque
//
//  Created by DS on 31/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
class ForgotPasswordViewModel: NSObject {
    
    var email: String?
  
    var completion: Completion?
    
    func requestForgotPassword(completion: @escaping Completion) {
        self.completion = completion
        if isValidrCredentials() {
            forgotPasswordRequeste()
        }else{
            return
        }

}
    
    //MARK:- Private Methods
    private func isValidrCredentials() -> Bool {
        if !email!.isValidEmail() {
            completion!(Response.error(Alert.Message.emailNotValid))
            return false
        }
        return true
    }
    
    
    private func forgotPasswordRequeste(){
        
        
let url: String = APPURL.ResetPasswordUrl
        let dict: [String: String] = ["Email":email!]
        ServerHit.sharedInstance.PostApi(dict: dict, Url: url) { (responseData, response)  in
            
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

