//
//  LinkedVC.swift
//  ArabeSque
//
//  Created by DS on 29/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
class LinkedVC: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var Webview :UIWebView!
    var is_For_Sharing:Bool = false
    
      var complationHandler:(( _ data:[String:Any]?,  _ error: NSError?) -> Void)?
    let linkedInKey = "81uzgojbygxsa2"
    //let linkedInKey = "86is4dpw2mc5m5"
    let linkedInSecret = "IHSjxMkvFS8gXwQe"
    //let linkedInSecret = "yHTGWfNl51A8raCp"
    let authorizationEndPoint = "https://www.linkedin.com/uas/oauth2/authorization"
    
    let accessTokenEndPoint = "https://www.linkedin.com/uas/oauth2/accessToken"
        // Do any additional setup after loading the view.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Webview.delegate = self
       
            if self.is_For_Sharing {
              
            }else{
                startAuthorization()
            }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Custom Functions
    
    
    func startAuthorization() {
        
        let responseType = "code"
        
        let redirectURL = "https://com.ArabeSque.linkedin.oauth/oauth".addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)!
        
        let state = "linkedin\(Int(Date().timeIntervalSince1970))"
        
        // let scope = "r_basicprofile%20r_emailaddress%20w_share"
        let scope = "w_share"
        
        var authorizationURL = "\(authorizationEndPoint)?"
        authorizationURL += "response_type=\(responseType)&"
        authorizationURL += "client_id=\(linkedInKey)&"
        authorizationURL += "redirect_uri=\(redirectURL)&"
        authorizationURL += "state=\(state)&"
        authorizationURL += "scope=\(scope)"
        
        print(authorizationURL)
        
        
        // Create a URL request and load it in the web view.
        let request = URLRequest(url: URL(string: authorizationURL)!)
        
        
        //  MBProgressHUD.showAdded(to: self.webView, animated: true)
        
        Webview.loadRequest(request)
    }
    
    
    func requestForAccessToken(_ authorizationCode: String)
    {
        
        let grantType = "authorization_code"
        let redirectURL = "https://com.ArabeSque.linkedin.oauth/oauth".addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)!
        var postParams = "grant_type=\(grantType)&"
        postParams += "code=\(authorizationCode)&"
        postParams += "redirect_uri=\(redirectURL)&"
        postParams += "client_id=\(linkedInKey)&"
        postParams += "client_secret=\(linkedInSecret)"
        
        
        let postData = postParams.data(using: String.Encoding.utf8)
        let request = NSMutableURLRequest(url: URL(string: accessTokenEndPoint)!)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.addValue("application/x-www-form-urlencoded;", forHTTPHeaderField: "Content-Type")
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { data,response,error in
            let httpResponse = response as? HTTPURLResponse
            
            if (error != nil) {
                print(error ?? "")
            } else {
                print(httpResponse ?? "")
                let statusCode = (response as! HTTPURLResponse).statusCode
                if statusCode == 200
                {
                    // Convert the received JSON data into a dictionary.
                    do
                    {
                        
                        let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
                        let accessToken = dataDictionary["access_token"] as! String
                        
                       
                        
                        if self.is_For_Sharing
                        {
                           
                        }else{
                            self.getUserProfileData(accessToken: accessToken)
                        }
                        
                        
                        
                    }
                    catch
                    {
                        print("Could not convert JSON data into a dictionary.")
                    }
                }
            }
            
        }
        dataTask.resume()
        
        
        
        
        
    }
    
    
    // MARK: UIWebViewDelegate Functions
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url!
        print(url)
        
        ////                           if url.host == "com.ArabeSque.linkedin.oauth" {
            
            if url.absoluteString.range(of: "code") != nil {
                
                let urlParts = url.absoluteString.components(separatedBy: "?")
                let code = urlParts[1].components(separatedBy: "=")[1]
                
                requestForAccessToken(code)
                }
                 /// }
        
           return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
       
        
    }
    
    //MARK:-
    // MARK:- Access the profile data
    func getUserProfileData(accessToken:String)  {
        
        print(accessToken)
        
        
        // let targetURLString = "https://api.linkedin.com/v1/people/~:(public-profile-url)?format=json"
        let targetURLString = "https://api.linkedin.com/v1/people/~:(id,first-name,last-name,maiden-name,email-address,Picture-url,headline)?format=json"
        
        let request = NSMutableURLRequest(url: URL(string: targetURLString)!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest) {data,response,error in
            let httpResponse = response as? HTTPURLResponse
            
            if (error != nil)
            {
                print(error ?? "")
                
                if let handler = self.complationHandler
                {
                    handler(nil,error as NSError?)
                }
                
            } else
            {
                print(httpResponse ?? "")
                
                let statusCode = (response as! HTTPURLResponse).statusCode
                
                if statusCode == 200 {
                    
                    if let handler = self.complationHandler
                    {
                        do {
                            let responsedata = try JSON.init(data: data!)
                            let responseDict = ["first_name":responsedata["firstName"].stringValue,"last_name":responsedata["lastName"].stringValue,"email":responsedata["emailAddress"].stringValue,"id":responsedata["id"].stringValue,"token":accessToken,"imageUrl":responsedata["pictureUrl"].stringValue] as [String:Any]
                            
                            handler(responseDict,nil)
                            
                        } catch {
                        }
                        
                        
                        
                    }
                    
                }else
                {
                    if let handler = self.complationHandler
                    {
                        handler(nil,nil)
                    }
                    
                }
                
                
            }
        }
        dataTask.resume()
        
        
    }
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }
   
   

}
