//
//  ExchangeCell.swift
//  SlidevC
//
//  Created by Macbook Pro on 11/10/1939 Saka.
//  Copyright © 1939 Saka Macbook Pro. All rights reserved.
//

import UIKit
import AlamofireImage
import SwiftyJSON
class ExchangeCell: UITableViewCell {
    
    @IBOutlet weak var productimage:UIImageView!
    @IBOutlet weak var recommend:UILabel!
     @IBOutlet weak var interetested:UILabel!
     @IBOutlet weak var like:UILabel!
    @IBOutlet weak var ItemName:UILabel!
    @IBOutlet weak var personname: UILabel!
    
    @IBOutlet weak var personImage:UIImageView!
    @IBOutlet weak var Exchangeprice:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(Api:ExchangeModel){
        
        productimage.layer.cornerRadius = 6
        productimage.clipsToBounds = true
        
        
       productimage.layer.borderWidth = 0.5
       productimage.layer.cornerRadius = 5
       productimage.layer.borderColor = UIColor.gray.cgColor
       productimage.layer.masksToBounds = true
        
        let fullString = NSMutableAttributedString(string: "")
        
        // create our NSTextAttachment
        
        let imageAttachment = NSTextAttachment()
        
        imageAttachment.image = UIImage(named: "recommend.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String = NSAttributedString(attachment: imageAttachment)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: Api.Recommened!))
        
        // draw the result in a label
        recommend.attributedText = fullString
        
        let fullString1 = NSMutableAttributedString(string: "")
        
        // create our NSTextAttachment
        
        let imageAttachment1 = NSTextAttachment()
        
        imageAttachment1.image = UIImage(named: "interested.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String1 = NSAttributedString(attachment: imageAttachment1)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString1.append(image1String1)
        fullString1.append(NSAttributedString(string: Api.Prolike!))
        
        // draw the result in a label
       interetested.attributedText = fullString1
        
        let fullString2 = NSMutableAttributedString(string: "")
        
        // create our NSTextAttachment
        
        let imageAttachment2 = NSTextAttachment()
        
        imageAttachment2.image = UIImage(named: "view.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String2 = NSAttributedString(attachment: imageAttachment2)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString2.append(image1String2)
        fullString2.append(NSAttributedString(string: Api.Proview!))
        
        // draw the result in a label
       like.attributedText = fullString2
        
        //View
        ItemName.text = Api.ProductName
        ////self.price.text = Api.price
        
        let json:JSON
           json = Api.Imagaarr[0]
       
       //// for json:JSON in [Api.Imagaarr  {
           // print(json)
            //let dict = json.dictionary
            Api.Productimage = json.dictionary!["imageURL"]?.string
            ///Api.Productimage = dict.value(forKey: "imageURL") as? String
             let url = URL(string:  Api.Productimage!)!
            productimage.af_setImage(withURL: url, placeholderImage:nil)
            
       // }
        
         personname.text =  Api.Personname
         Exchangeprice.text = Api.ExchangePrice
        
        let photo = Api.personImg
        
       
        //opuntia_cactus.jpg
        
        let url1 = URL(string: photo!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
         personImage.af_setImage(withURL: url1, placeholderImage:nil)
         personImage.roundedImage()
        
    }
    
    
}
extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
