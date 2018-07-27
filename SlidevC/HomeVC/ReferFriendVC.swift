//
//  ReferFriendVC.swift
//  ArabeSque
//
//  Created by DS on 23/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ReferFriendVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backButtonTapped() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.setside()
        
    }
   

}