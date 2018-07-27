//
//  ReviewVC.swift
//  SlidevC
//
//  Created by DS on 22/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ReviewVC: UIViewController {
    @IBOutlet weak var interetested:UILabel!
    @IBOutlet weak var viewlabel:UILabel!
    var Group: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Review & Public"
        
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
        
        
        let fullString1 = NSMutableAttributedString(string: "")
        
        let imageAttachment1 = NSTextAttachment()
        
        imageAttachment1.image = UIImage(named: "interested.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String1 = NSAttributedString(attachment: imageAttachment1)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString1.append(image1String1)
        fullString1.append(NSAttributedString(string: " 18 People Interested"))
        
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
        fullString2.append(NSAttributedString(string: " 24 People Viewed "))
        
        // draw the result in a label
        viewlabel.attributedText = fullString2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func backButtonTapped() {
        
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func EventBtn(_ sender: Any) {
        
        
    }
}
