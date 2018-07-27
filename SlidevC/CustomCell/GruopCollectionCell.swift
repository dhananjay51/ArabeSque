//
//  GruopCollectionCell.swift
//  SlidevC
//
//  Created by DS on 22/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class GruopCollectionCell: UICollectionViewCell {
    @IBOutlet weak var star:UILabel!
    @IBOutlet weak var  logo:UIImageView!
    @IBOutlet weak var personimge:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
func configureCell(Api:GroupModel){
    
    
    let fullString = NSMutableAttributedString(string: "")
    
    // create our NSTextAttachment
    
    let imageAttachment = NSTextAttachment()
    
    imageAttachment.image = UIImage(named: "star.png")
    
    // wrap the attachment in its own attributed string so we can append it
    let imageString = NSAttributedString(attachment: imageAttachment)
    
    // add the NSTextAttachment wrapper to our full string, then add some more text.
    fullString.append(imageString)
    fullString.append(NSAttributedString(string: " 24 "))
    
    // draw the result in a label
    star.attributedText = fullString
    let photo = Api.PersonImage
    
    
    //opuntia_cactus.jpg
    
    let url1 = URL(string: photo!)!
    //let placeholderImage = UIImage(named: "placeholder")!
    
    personimge.af_setImage(withURL: url1, placeholderImage:nil)
    let Logo = Api.Logo
    
    
    //opuntia_cactus.jpg
    
    let url = URL(string: Logo!)!
    //let placeholderImage = UIImage(named: "placeholder")!
    
    logo.af_setImage(withURL: url, placeholderImage:nil)
    personimge.Image()
    

    }
    
func configureCell(Api:PeopleModel){
    
    
    let fullString = NSMutableAttributedString(string: "")
    
    // create our NSTextAttachment
    
    let imageAttachment = NSTextAttachment()
    
    imageAttachment.image = UIImage(named: "star.png")
    
    // wrap the attachment in its own attributed string so we can append it
    let imageString = NSAttributedString(attachment: imageAttachment)
    
    // add the NSTextAttachment wrapper to our full string, then add some more text.
    fullString.append(imageString)
    fullString.append(NSAttributedString(string: " 24 "))
    
    // draw the result in a label
    star.attributedText = fullString
    
    let photo = Api.PictureUrl
    
    
    //opuntia_cactus.jpg
    
    let url1 = URL(string: photo!)!
    //let placeholderImage = UIImage(named: "placeholder")!
    
   personimge.af_setImage(withURL: url1, placeholderImage:nil)
    
    let Logo = Api.Coverpic
    
    
    //opuntia_cactus.jpg
    
    let url = URL(string: Logo!)!
    //let placeholderImage = UIImage(named: "placeholder")!
    
    logo.af_setImage(withURL: url, placeholderImage:nil)
    personimge.Image()
   
}
    
 func configureCell(Api:EventModel){
        
        
        let fullString = NSMutableAttributedString(string: "")
        
        // create our NSTextAttachment
        
        let imageAttachment = NSTextAttachment()
        
        imageAttachment.image = UIImage(named: "star.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString.append(imageString)
        fullString.append(NSAttributedString(string: " 24 "))
        
        // draw the result in a label
        star.attributedText = fullString
        
        let photo = Api.PersonImage
        
        
        //opuntia_cactus.jpg
        
        let url1 = URL(string: photo!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        personimge.af_setImage(withURL: url1, placeholderImage:nil)
        
        let Coverphoto = Api.PictureURL
        
        
        //opuntia_cactus.jpg
        
        let url = URL(string: Coverphoto!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        logo.af_setImage(withURL: url, placeholderImage:nil)
        personimge.Image()
        
    }
    
}


extension UIImageView {
    
    func Image() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
