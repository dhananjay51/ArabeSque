//
//  ChangePasswordVC.swift
//  ArabeSque
//
//  Created by DS on 25/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class ChangePasswordVC: UIViewController {
    @IBOutlet weak var oldpassword:SkyFloatingLabelTextField!
    @IBOutlet weak var newpassword: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmpassword: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Update Password"
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
    @IBAction func EducationButton(_ sender: Any) {
        
        let passwordvc = self.storyboard?.instantiateViewController(withIdentifier: "EquacationVC") as! EquacationVC
        self.navigationController?.pushViewController(passwordvc, animated: true)
        
    }
 

}
