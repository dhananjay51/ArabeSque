//
//  CreateEventVC.swift
//  ArabeSque
//
//  Created by DS on 27/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class CreateEventVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Your Event"
        
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func backButtonTapped() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
     @IBAction func Start(_ sender: Any) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "EventDetailVC") as! EventDetailVC
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    

}
