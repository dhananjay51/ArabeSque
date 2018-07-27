//
//  NetworkManager.swift
//  Maisonette
//
//  Created by IRCTC-ITC on 30/10/17.
//  Copyright © 2017 Rohit. All rights reserved.
//

import UIKit

enum Method {
    case searchProperty
}

class NetworkManager: NSObject {
    typealias completionBlock = (_ responseData: Data?, _ response: Response) -> Void
    
    enum Method: String {
        case Post = "POST"
        case Get = "GET"
    }
    
    enum StatusCode: Int {
        case success = 200
        case notAuthorized = 403
    }
    
    
//MARK: Public Methods
    public func request(url: URL, param: [String: Any], header: [String: String], method: Method, complitionHandler: @escaping completionBlock) {
        if hasConnectivity() {
            
            if let request = createRequest(url: url, method: method, param: param, header: header) {
                _ = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    
                    if error == nil {//No Error occurred
                        let statusCode = response!.statusCode()
                        if statusCode == StatusCode.notAuthorized.rawValue
                        {
                            
                            return
                        }
                        /*else if statusCode != StatusCode.success.rawValue {
                         complitionHandler(nil, Response.error((response?.description)!))
                         return
                         }*/
                        
                        if data != nil {//No Data Found
                            do {
                                let jsonObject = try JSONSerialization.jsonObject(with: data!, options: [.allowFragments, .mutableContainers, .mutableLeaves])
                                print( jsonObject)
                                if jsonObject is Dictionary<AnyHashable,Any> {
                                    if (jsonObject as! Dictionary<AnyHashable,Any>).keys.contains("Message") {
                                       // complitionHandler(data, Response.error((jsonObject as! Dictionary<AnyHashable,Any>)["Message"] as! String))
                                         complitionHandler(data, Response.success(Alert.Message.success))
                                    }
                                    else if (jsonObject as! Dictionary<AnyHashable,Any>).keys.contains("ErrorMessage") {
                                        complitionHandler(data, Response.error((jsonObject as! Dictionary<AnyHashable,Any>)["ErrorMessage"] as! String))
                                    }else{
                                        complitionHandler(data, Response.success(Alert.Message.success))
                                    }
                                }else if (jsonObject is String) &&  ((jsonObject as! String) == "True" || (jsonObject as! String) == "Success" || (jsonObject as! NSString).length
                                    > 500) {
                                    complitionHandler(data, Response.success(Alert.Message.success))
                                }else if (jsonObject is String) {
                                    complitionHandler(data, Response.error(jsonObject as! String))
                                }else {
                                    complitionHandler(data, Response.success(Alert.Message.unknownError))
                                }
                            } catch let error as NSError {//Json parsing error
                                print(error)
                                complitionHandler(nil, Response.error(Alert.Message.unknownError))
                            }
                        }else{//Network Error Controller will handle
                            complitionHandler(nil, Response.error(Alert.Message.unknownError))
                        }
                    }else{//Network Error Controller will handle
                        complitionHandler(nil, Response.error(Alert.Message.serverBusy))
                    }
                }).resume()
            }else{//Failed to create URLRequest
                complitionHandler(nil, Response.error(Alert.Message.unknownError))
            }
        }else{//No Internet Connection
            complitionHandler(nil, Response.error(Alert.Message.internetError))
        }
    }
    
    
    //MARK: Private Methods
    private func createRequest(url: URL, method: Method, param: [String: Any], header: [String: String]) -> URLRequest? {
        var headers = header
        headers["content-type"] = "application/json"
      
        do {
            let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
            request.httpMethod = method.rawValue
            request.allHTTPHeaderFields = headers
            if method == .Post {
                let postData = try JSONSerialization.data(withJSONObject: param, options: [])
                request.httpBody = postData as Data
            }
            request.timeoutInterval = 60.0
            return request as URLRequest
        } catch let error as NSError
        {
            print(error)
            return nil
        }
    }
    
    
    //MARK: #- Connectivity
    func hasConnectivity() -> Bool {
        do {
            let reachability = try Reachability()
            if let reachable = reachability {
                if reachable.isConnectedToNetwork  { return true }
            }else{ return false }
        } catch _ as NSError { return false }
        return false
    }
    deinit {
        print("Data handler is deinitialized")
    }
}


//MARK:- URLResponse Extension
extension URLResponse {
    func statusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}



