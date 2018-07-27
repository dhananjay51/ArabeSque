//
//  EventModel.swift
//  ArabeSque
//
//  Created by DS on 19/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class EventModel: NSObject {
    var EventName:String?
    var Description:String?
    var PictureURL :String?
    var PersonImage:String?
    var CoverImage:String?
    var startDate:String?
    var EndDate: String?

    func setJson(json:JSON)
    {
        
        EventName = json["EventName"].stringValue
        
        Description = json["Description"].stringValue
        
        CoverImage = json["CoverPic"].stringValue
        
        PictureURL = json["PictureURL"].stringValue
         PersonImage = json["PersonImage"].stringValue
         startDate = json["StartDate"].stringValue
         EndDate = json["EndDate"].stringValue
        
    }

}
