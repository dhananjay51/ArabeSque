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
     var ChangeViewmodel = ChangePasswordViewModel(model: nil)
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
    @IBAction func ForgotPasswordbtn(_ sender: UIButton) {
        
        let passwordvc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPVC") as! ForgotPVC
        self.navigationController?.pushViewController(passwordvc, animated: true)
        
    }
  @IBAction func ChangeButton(_ sender: Any) {
     ChangeViewmodel.Oldpassword = oldpassword.text!
    ChangeViewmodel.NewPassword = newpassword.text!
    ChangeViewmodel.ConfirmNewPassword = confirmpassword.text!
    
      displayAlertView.displayFullViewActivityIndicator(view)
    
      ChangeViewmodel.changePassword(completion: {
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


