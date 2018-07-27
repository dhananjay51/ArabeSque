//
//  CreateGroupVC.swift
//  SlidevC
//
//  Created by DS on 22/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class CreateGroupVC: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Create Your Group"
        
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Start(_ sender: Any) {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "GroupDetailVC") as! GroupDetailVC
          //VC.Group = "Group"
          
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    @objc func backButtonTapped() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    

}
