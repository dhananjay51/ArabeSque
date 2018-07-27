//
//  EventCategory.swift
//  ArabeSque
//
//  Created by DS on 23/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class EventCategory: NSObject {
    
    var  CategoryID: String?
    var  Category: String?
    func setJson(json:JSON)
    {
        
        CategoryID = json["CategoryID"].stringValue
        
        Category = json["Category"].stringValue
        
       
        
    }

}
