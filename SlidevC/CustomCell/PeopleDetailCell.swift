//
//  PeopleDetailCell.swift
//  ArabeSque
//
//  Created by DS on 23/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import AlamofireImage

class PeopleDetailCell: UITableViewCell {

    @IBOutlet weak var Dateofbirth: UILabel!
    @IBOutlet weak var Email :UILabel!
    @IBOutlet weak var  Gender:UILabel!
    @IBOutlet weak var Nationality:UILabel!
    @IBOutlet weak var Residence:UILabel!
    @IBOutlet weak var maritalStatus:UILabel!
     @IBOutlet weak var About:UILabel!
    
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
         Dateofbirth.text  = Api.Birthday
        Email.text = ""
          Gender.text = Api.Gender
        Nationality.text = Api.Nationality
        Residence.text =  Api.ResidenceCountry
         maritalStatus.text = Api.MaritalStatus
         About.text = Api.AbountMe
        
    }
}
