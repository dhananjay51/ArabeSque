//
//  GroupModel.swift
//  ArabeSque
//
//  Created by DS on 18/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
class GroupModel: NSObject {
    
    var GrouPName:String?
    var  Description:String?
    var Logo :String?
    var PersonImage:String?
   
    func setJson(json:JSON)
    {
     
        GrouPName = json["GroupName"].stringValue
        
        Description = json["Description"].stringValue
        
        Logo = json["Logo"].stringValue
        PersonImage = json["PersonImage"].stringValue
        
        
    }

}
