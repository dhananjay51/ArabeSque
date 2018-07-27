//
//  peopleimageCell.swift
//  ArabeSque
//
//  Created by DS on 23/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class peopleimageCell: UITableViewCell {
    @IBOutlet weak var CovewrPick: UIImageView!
    @IBOutlet weak var Profile :UIImageView!
    @IBOutlet weak var name :UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(Api:PeopleDetailModel)
    {
       
        
        let url = URL(string:  Api.CoverPic!)!
        CovewrPick.af_setImage(withURL: url, placeholderImage:nil)
        name.text =  Api.FirstName
       
        
        let photo = Api.PickPictureURL
        
        
    
        
        let url1 = URL(string: photo!)!
      
        
        Profile.af_setImage(withURL: url1, placeholderImage:nil)
        Profile.PImage()
        
        
    }
}
extension UIImageView {
    
    func PImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
