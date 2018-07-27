//
//  ServerHit.swift
//  SwiftDemoApi
//
//  Created by Macbook Pro on 15/04/18.
//  Copyright © 2018 Punnet. All rights reserved.
//

import UIKit
import Alamofire


typealias Completion = (_ response: Response) -> Void

 typealias completionBlock = (_ responseData: NSDictionary?, _ response: Response) -> Void
class ServerHit: NSObject {
    
    var GroupRecommended_List:[ GroupModel] = []
    
    static let sharedInstance = ServerHit()
    
    
    func PostApi(dict: [String:String],Url:String, completionHandler : @escaping completionBlock){
        let url = Url
        print("",url)
          print("",dict)
          if  hasConnectivity(){
         Alamofire.request(url, method: .post, parameters: dict, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            print(response)
            
            completionHandler(response.result.value as? NSDictionary,Response.success(""))
            
            }
          }
            
        else{
            completionHandler(nil, Response.error(Alert.Message.internetError))
            
        }
    }
    
  func GetApi(Dict:[String:String],Url:String, completionHandler :@escaping  completionBlock){
    
    
        let url = Url
        print("",url)
        print("",Dict)
    if  hasConnectivity(){
        
    
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { response in
           
            
            print(response)
            
            completionHandler(response.result.value as? NSDictionary,Response.success(""))
            
        }
    }
        
    else{
        completionHandler(nil, Response.error(Alert.Message.internetError))
        
    }
        
 
    }
    
    //MARK: #- Connectivity
    func hasConnectivity() -> Bool {
        do {
            let reachability = try Reachability()
            if let reachable = reachability {
                if reachable.isConnectedToNetwork
                { return true
                    
                }
            }
            else{
                return false
                
            }
        }
        catch _ as NSError
        { return false
            
        }
        return false
    }
    deinit {
        print("Data handler is deinitialized")
    }
}


