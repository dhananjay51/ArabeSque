//
//  PeopleDetailModel.swift
//  ArabeSque
//
//  Created by DS on 24/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class PeopleDetailModel: NSObject {
    
    var FirstName:String?
    var LastName:String?
    var Birthday:String?
    var Gender:String?
    var Nationality:String?
    var ResidenceCountry:String?
    var MaritalStatus :String?
    var CoverPic:String?
    var PickPictureURL:String?
    var AbountMe:String?
    
  /*
        "FirstName": "iij",
        "LastName": "",
        "BirthDate": null,
        "UserAge": null,
        "Gender": null,
        "Nationality": null,
        "ResidenceCountry": null,
        "MaritalStatus": null,
        "CoverPic": "http://api.goarabesque.com/Content/images/NoCoverImage.png",
        "PictureURL": "http://api.goarabesque.com/Content/images/NoProfileImage.png",
        "AboutMe": null
 */
    func setJson(json:JSON)
    {
        
        FirstName = json["FirstName"].stringValue
        
        LastName = json["LastName"].stringValue
        
        Birthday = json["BirthdayName"].stringValue
        
        Gender = json["Gender"].stringValue
        Nationality = json["Nationality"].stringValue
        
        ResidenceCountry = json["ResidenceCountry"].stringValue
        
        MaritalStatus = json["MaritalStatus"].stringValue
        
         CoverPic = json["CoverPic"].stringValue
         PickPictureURL = json["PickPictureURL"].stringValue
         AbountMe = json["AboutMe"].stringValue
        
    }
    init(parameters: [String: Any]) {
        
        
        self.FirstName = parameters["FirstName"] as? String
        
        self.LastName = parameters["LastName"]as? String
        
        self.Birthday = parameters["BirthdayName"]as? String
        
        self.Gender = parameters["Gender"] as? String
        self.Nationality = parameters["Nationality"]as? String
        
        self.ResidenceCountry = parameters["ResidenceCountry"]as? String
        
       self.MaritalStatus = parameters["MaritalStatus"]as? String
        
        self.CoverPic = parameters["CoverPic"]as? String
        self.PickPictureURL = parameters["PictureURL"]as? String
        self.AbountMe = parameters["AboutMe"]as? String
       
        super.init()
    }

}
