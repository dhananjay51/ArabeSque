//
//  DetailCell.swift
//  ArabeSque
//
//  Created by DS on 20/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import AlamofireImage
class DetailCell: UICollectionViewCell {
    @IBOutlet  weak  var productImge:UIImageView!
    @IBOutlet  weak  var proView:UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var borderColor: CGColor! = UIColor.clear.cgColor
         var borderWidth: CGFloat = 0
        
        
         borderColor = UIColor.darkGray.cgColor
         borderWidth = 0.5 //or whatever you please
        
        
        proView.layer.borderWidth = borderWidth
        proView.layer.borderColor = borderColor
         proView.layer.cornerRadius = 10
         proView.clipsToBounds = true
        // Initialization code
    }
    func  Configuration(image:String)  {
      
        
        
        //opuntia_cactus.jpg
        
        let url1 = URL(string: image)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        productImge.af_setImage(withURL: url1, placeholderImage:nil)
       
        
    }
}
