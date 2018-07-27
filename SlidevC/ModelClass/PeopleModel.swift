//
//  PeopleModel.swift
//  ArabeSque
//
//  Created by DS on 19/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class PeopleModel: NSObject {
    var  PictureUrl:String?
    var  Coverpic:String?
    var name :String?
    var desc:String?
     var UserId:String?
    
    
    
    func setJson(json:JSON)
    {
        
        name = json["Name"].stringValue
        
        desc = json["Description"].stringValue
        
        Coverpic = json["CoverPic"].stringValue
        
        PictureUrl = json["PictureUrl"].stringValue
         UserId = json["ID"].stringValue
        
    }
    
}
