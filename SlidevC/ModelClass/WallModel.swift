//
//  WallModel.swift
//  ArabeSque
//
//  Created by DS on 24/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class WallModel: NSObject {
    
       var PostID : String?
       var PostText : String?
       var CommentsCount:String?
       var Likes :String?
       var PostedBy = [JSON]()
       var   Comments = [JSON]()
       var FirstName :String?
       var LastName :String?
       var PictureUrl :String?
       var CoverPic :String?
       var Recommendations :String?
     var MySelf: String?
    
    func setJson(json:JSON)
    {
        PostID = json["PostID"].stringValue
        
        PostText = json["PostText"].stringValue
        CommentsCount = json["CommentsCount"].stringValue
        
        Likes = json["Likes"].stringValue
        PostedBy = json["PostedBy"].array!
        
        Comments = json["Comments"].array!
       // FirstName = json["FirstName"].stringValue
        // LastName = json["LastName"].stringValue
        //PictureUrl = json["PictureUrl"].stringValue
        //CoverPic = json["CoverPic"].stringValue
        // Recommendations = json["Recommendations"].stringValue
         // MySelf = json["Myself"].string
        
        
    }
    func PostJson(json:JSON)
    {
        
        FirstName = json["FirstName"].stringValue
        LastName = json["LastName"].stringValue
        PictureUrl = json["PictureUrl"].stringValue
        CoverPic = json["CoverPic"].stringValue
        Recommendations = json["Recommendations"].stringValue
        MySelf = json["Myself"].string
        
        
    }
    
}
