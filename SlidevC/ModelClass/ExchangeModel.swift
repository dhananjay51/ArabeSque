//
//  ExchangeModel.swift
//  ArabeSque
//
//  Created by DS on 18/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class ExchangeModel: NSObject {

    
    var Productimage:String?
    var  ProductName:String?
    var Recommened :String?
    var Prolike:String?
    var Proview:String?
    
    var Personname:String?
    var personImg:String?
    var Imagaarr = [JSON]()
    var ExchangePrice:String?
    var Decription:String?
    
    
    
    
    func setJson(json:JSON)
{
    
     ProductName = json["ItemName"].stringValue
    
     Recommened = json["RecommendedBy"].stringValue
    
     Prolike = json["InterestedBy"].stringValue
     Proview = json["ViewedBy"].stringValue
    personImg = json["PersonImage"].stringValue
    Personname = json["PersonName"].stringValue
    Imagaarr = json["ItemImages"].array!
    ExchangePrice = json["ExchangeOfPrice"].stringValue
    Decription = json["Description"].stringValue
    
    }
}
