//
//  Regroup.swift
//  ArabeSque
//
//  Created by DS on 26/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class Regroup: UICollectionViewCell {
    
    @IBOutlet var CoverPic: UIImageView!
    @IBOutlet var ProImage: UIImageView!
    @IBOutlet var Name: UILabel!
    
    func cell(Api: GroupModel)  {
        Name.text = Api.GrouPName
      
        let photo = Api.PersonImage
        
        
        //opuntia_cactus.jpg
        
        let url1 = URL(string: photo!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        ProImage.af_setImage(withURL: url1, placeholderImage:nil)
        let Logo = Api.Logo
        
        
        //opuntia_cactus.jpg
        
        let url = URL(string: Logo!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        CoverPic.af_setImage(withURL: url, placeholderImage:nil)
        ProImage.layer.cornerRadius = ProImage.frame.size.width / 2
        ProImage.clipsToBounds = true
        
    }
}

