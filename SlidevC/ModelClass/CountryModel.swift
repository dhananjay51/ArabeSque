//
//  CountryModel.swift
//  ArabeSque
//
//  Created by DS on 27/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
class CountryModel: NSObject {

     var CountryName:String?
     var CountryID:String?
    func setJson (json:JSON)
    {
        
        CountryName = json["NameEn"].stringValue
        CountryID = json["ID"].stringValue
       
        }
    
}
