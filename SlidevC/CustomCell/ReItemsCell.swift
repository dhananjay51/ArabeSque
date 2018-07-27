//
//  ReItemsCell.swift
//  ArabeSque
//
//  Created by DS on 26/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage
class ReItemsCell: UICollectionViewCell {
    @IBOutlet weak var ProductImg:UIImageView!
    @IBOutlet weak var productName:UILabel!
    @IBOutlet weak var productDescription:UILabel!
     @IBOutlet weak var productprice:UILabel!
    @IBOutlet weak var UserImge:UIImageView!
     @IBOutlet weak var UserName:UILabel!
    


func configureCell(Api:ExchangeModel){
    //ProductInfo
   productName.text = Api.ProductName
   
    let json:JSON
    json = Api.Imagaarr[0]
    
    
    Api.Productimage = json.dictionary!["imageURL"]?.string
   
    let url = URL(string:  Api.Productimage!)!
    ProductImg.af_setImage(withURL: url, placeholderImage:nil)
     productprice.text = Api.ExchangePrice
     productDescription.text = Api.Decription
    //UserInfo
    let photo = Api.personImg
    
    let url1 = URL(string: photo!)!
    
   UserImge.af_setImage(withURL: url1, placeholderImage:nil)
    UserImge.layer.cornerRadius = UserImge.frame.size.width / 2
    UserImge.clipsToBounds = true
   UserName.text =  Api.Personname
    
}
    
}
