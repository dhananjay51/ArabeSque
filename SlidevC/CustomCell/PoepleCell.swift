//
//  PoepleCell.swift
//  ArabeSque
//
//  Created by DS on 26/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import AlamofireImage

class PoepleCell: UITableViewCell {
    
    @IBOutlet weak var CoverPic:UIImageView!
    @IBOutlet weak var ProfilePic:UIImageView!
    @IBOutlet weak var Name:UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     func configureCell(Api:PeopleModel){
        
        Name.text = Api.name
     
        
        
        
        let photo = Api.Coverpic
        
        
        //opuntia_cactus.jpg
        
        let url1 = URL(string: photo!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        CoverPic.af_setImage(withURL: url1, placeholderImage:nil)
        
        
        
        let Logo = Api.PictureUrl
        
        
        //opuntia_cactus.jpg
        
        let url = URL(string: Logo!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        ProfilePic.af_setImage(withURL: url, placeholderImage:nil)
           ProfilePic.PeopleImage()
       
    }
    
}
extension UIImageView {
    
    func PeopleImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
