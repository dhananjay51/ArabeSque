//
//  GroupCategory.swift
//  ArabeSque
//
//  Created by DS on 25/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
class GroupCategory: NSObject {
    
    var  CategoryID: String?
    var  Category: String?
    func setJson(json:JSON)
    {
        
        CategoryID = json["CategoryID"].stringValue
        
        Category = json["Category"].stringValue
    }
    
        
        
}
