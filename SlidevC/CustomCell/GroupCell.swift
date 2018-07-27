//
//  GroupCell.swift
//  SlidevC
//
//  Created by Macbook Pro on 11/10/1939 Saka.
//  Copyright © 1939 Saka Macbook Pro. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    @IBOutlet weak var interested: UILabel!
    @IBOutlet weak var like :UILabel!
    @IBOutlet weak var  logo:UIImageView!
    @IBOutlet weak var personimge:UIImageView!
    @IBOutlet weak var Groupname:UILabel!
    @IBOutlet weak var Decription:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
      func configureCell(Api:GroupModel){
        let fullString1 = NSMutableAttributedString(string: "")
        
        let imageAttachment1 = NSTextAttachment()
        
        imageAttachment1.image = UIImage(named: "interested.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String1 = NSAttributedString(attachment: imageAttachment1)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString1.append(image1String1)
        fullString1.append(NSAttributedString(string: " 18 People Interested"))
        
        // draw the result in a label
      interested.attributedText = fullString1
        
        let fullString2 = NSMutableAttributedString(string: "")
        
        // create our NSTextAttachment
        
        let imageAttachment2 = NSTextAttachment()
        
        imageAttachment2.image = UIImage(named: "view.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String2 = NSAttributedString(attachment: imageAttachment2)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString2.append(image1String2)
        fullString2.append(NSAttributedString(string: " 24 People Viewed "))
        
        // draw the result in a label
       like.attributedText = fullString2
        Groupname.text = Api.GrouPName
         Decription.text = Api.Description
        
        
        
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
        personimge.groupImage()
         
        
    }
    
    
    func configureCell(Api:EventModel){
        let fullString1 = NSMutableAttributedString(string: "")
        
        let imageAttachment1 = NSTextAttachment()
        
        imageAttachment1.image = UIImage(named: "interested.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String1 = NSAttributedString(attachment: imageAttachment1)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString1.append(image1String1)
        fullString1.append(NSAttributedString(string: " 18 People Interested"))
        
        // draw the result in a label
        interested.attributedText = fullString1
        
        let fullString2 = NSMutableAttributedString(string: "")
        
        // create our NSTextAttachment
        
        let imageAttachment2 = NSTextAttachment()
        
        imageAttachment2.image = UIImage(named: "view.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String2 = NSAttributedString(attachment: imageAttachment2)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString2.append(image1String2)
        fullString2.append(NSAttributedString(string: " 24 People Viewed "))
        
        // draw the result in a label
        like.attributedText = fullString2
        Groupname.text = Api.EventName
        Decription.text = Api.Description
        
        let photo = Api.PersonImage
        
        
        //opuntia_cactus.jpg
        
        let url1 = URL(string: photo!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        personimge.af_setImage(withURL: url1, placeholderImage:nil)
        let Logo = Api.PictureURL
        
        
        //opuntia_cactus.jpg
        
        let url = URL(string: Logo!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        logo.af_setImage(withURL: url, placeholderImage:nil)
        personimge.groupImage()
        
        
    }
    
    
}
extension UIImageView {
    
    func groupImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
