//
//  ExchangeCollectionCell.swift
//  SlidevC
//
//  Created by DS on 22/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage
class ExchangeCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var productimage:UIImageView!
    
    @IBOutlet weak var ItemName:UILabel!
    @IBOutlet weak var personname: UILabel!
    
    @IBOutlet weak var personImage:UIImageView!
    @IBOutlet weak var Exchangeprice:UILabel!
    @IBOutlet weak var Decription:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(Api:ExchangeModel){
        
       
        //View
        ItemName.text = Api.ProductName
        
        ////self.price.text = Api.price
        Decription.text = Api.description
        
        let json:JSON
        json = Api.Imagaarr[0]
            //let dict = json.dictionary
            Api.Productimage = json.dictionary!["imageURL"]?.string
            ///Api.Productimage = dict.value(forKey: "imageURL") as? String
            let url = URL(string:  Api.Productimage!)!
            productimage.af_setImage(withURL: url, placeholderImage:nil)
            
        
        
        personname.text =  Api.Personname
        Exchangeprice.text = Api.ExchangePrice
        let photo = Api.personImg
        
        
        //opuntia_cactus.jpg
        
        let url1 = URL(string: photo!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        personImage.af_setImage(withURL: url1, placeholderImage:nil)
        personImage.rounded1Image()
        
    }
    
    
}
extension UIImageView {
    
    func rounded1Image() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}


