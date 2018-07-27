//
//  MSSingalton.swift
//  Maisonette
//
//  Created by Muneesh Chauhan on 10/12/17.
//  Copyright © 2017 Rohit. All rights reserved.
//

import Foundation
import SwiftyJSON
final class MSSingleton {
    
    // Can't init is singleton
    private init() { }
    // MARK: Shared Instance
    static let shared = MSSingleton()
    // MARK: Local Variable
   
    var isUserLogedin = false
    var isNeedToUpdatePropertyFromServer = false
   
    var deviceToken:String = ""
    var countryID:String = "0"
    
  
    var managerListPageIndex:Int = 1
    
    
    
    var pm_brokerListPageIndex:Int = 1
    var pm_propertyListPageIndex:Int = 1
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
   
    var pageIndex_BrokerPrperties:Int = 1
   
    
    
    
}
