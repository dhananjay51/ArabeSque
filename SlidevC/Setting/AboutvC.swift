//
//  AboutvC.swift
//  SlidevC
//
//  Created by Macbook Pro on 30/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit

class AboutvC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
        self.title = "FAQ"
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
