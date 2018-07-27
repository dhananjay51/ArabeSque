//
//  MyinternetVC.swift
//  ArabeSque
//
//  Created by DS on 25/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class MyinternetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "My Internet"
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func backButtonTapped() {
        
        self.navigationController?.popViewController(animated: true)
        
    }

}
