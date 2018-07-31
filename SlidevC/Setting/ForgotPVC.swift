//
//  ForgotPVC.swift
//  ArabeSque
//
//  Created by DS on 25/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class ForgotPVC: UIViewController {
    @IBOutlet weak var Email :SkyFloatingLabelTextField!
     var  forgotModel = ForgotPasswordViewModel()
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.title = "Forgot Password"
         self.navigationController?.navigationBar.isHidden = false
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
    @IBAction func ForgotPasswordbtn(_ sender: UIButton){
        
        forgotModel.email = Email.text!

       displayAlertView.displayFullViewActivityIndicator(view)
        
        forgotModel.requestForgotPassword(completion: {
            (response) in
            displayAlertView.removeFullViewActivityIndicator(self.view)
            switch response {
            case .success(let msg)://Show alert msg for success
                AlertController.showAlert(title: Alert.Title.login, message: msg)
            case .error(let msg)://Show alert msg for failure
                AlertController.showAlert(title: Alert.Title.login, message: msg)
                displayAlertView.removeFullViewActivityIndicator(self.view)
            }
        })
        
        
    }
        
    

}
