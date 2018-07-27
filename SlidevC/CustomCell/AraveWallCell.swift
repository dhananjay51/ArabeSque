//
//  AraveWallCell.swift
//  ArabeSque
//
//  Created by DS on 23/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage

class AraveWallCell: UITableViewCell {
 
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var myself:UILabel!
    @IBOutlet weak var posttext:UILabel!
    @IBOutlet weak var CommentCount:UILabel!
    @IBOutlet weak var Recommended:UILabel!
    @IBOutlet weak var Intested:UILabel!
    @IBOutlet weak var Propic:UIImageView!
    @IBOutlet weak var CoverPic:UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func CellConfi (Api:WallModel)  {
        
         self.posttext.text =  Api.PostText
        self.Intested.text =  Api.Likes! + "  " +  "interested"
        self.CommentCount.text = Api.CommentsCount! + "  " + "Comment"
        
        let json:JSON
        json = Api.PostedBy[0]
        Api.CoverPic = json.dictionary!["CoverPic"]?.string
       
        let url = URL(string:  Api.CoverPic!)!
        CoverPic.af_setImage(withURL: url, placeholderImage:nil)
        
        name.text =  json.dictionary!["FirstName"]?.string
         myself.text =  json.dictionary!["Myself"]?.string
       // Recommended.text = json.dictionary!["Recommendations"]?.string
        Recommended.text  = "0"  + "  " + "Recommended"
        let photo = json.dictionary!["PictureUrl"]?.string
        
        
        let url1 = URL(string: photo!)!
     
        
        Propic.af_setImage(withURL: url1, placeholderImage:nil)
        Propic.layer.cornerRadius = Propic.frame.size.width / 2
        Propic.clipsToBounds = true
        
    }
}
