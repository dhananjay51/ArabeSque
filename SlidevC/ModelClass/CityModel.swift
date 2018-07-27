//
//  CityModel.swift
//  ArabeSque
//
//  Created by DS on 27/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
class CityModel: NSObject {
    var CityName:String?
    var CityID:String?
    var CountryID:String?
    
func setJson (json:JSON)
    {
        
         CityName = json["CityName"].stringValue
         CityID = json["CityID"].stringValue
          CountryID = json["CountryID"].stringValue
        
        
    }
}
