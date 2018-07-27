//
//  RegisterVC.swift
//  SlidevC
//
//  Created by Macbook Pro on 30/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class RegisterVC: UIViewController {
    @IBOutlet weak var name:SkyFloatingLabelTextField!
    @IBOutlet weak var email :SkyFloatingLabelTextField!
    @IBOutlet weak var Password:SkyFloatingLabelTextField!
    @IBOutlet weak var Confirmp:SkyFloatingLabelTextField!
    @IBOutlet weak var Checkbtn: UIButton!
    
    var viewModel = RegisterViewModel(model: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkBtn(_ sender: UIButton) {
        if Checkbtn.isSelected == true {
            Checkbtn.isSelected = false
            
        }
        else{
            Checkbtn.isSelected = true
        }
        
        
        /// Login()
        
    }
@IBAction func RegisterBtn(_ sender: Any) {
    
          Register()
    }
    func  Register()  {
        viewModel.username = name.text!
        viewModel.useremail = email.text!
        viewModel.password = Password.text!
        viewModel.confirmpassword = Confirmp.text!
          viewModel.checmaark = "true"
        
          displayAlertView.displayFullViewActivityIndicator(view)
        viewModel.SignUp(checkValidation: true, completion: {(response) in
            displayAlertView.removeFullViewActivityIndicator(self.view)
            switch response {
            case .success(let msg):
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.setside()
                //Show alert msg for success
               // self.presentAlert(title: Alert.Title.signUp, message: msg, actionTitlesAndStyles: [("Ok", UIAlertActionStyle.default)], completionIndex: { (index) in
                   
                //})
            case .error(let msg)://Show alert msg for failure
                AlertController.showAlert(title: Alert.Title.signUp, message: msg)
                displayAlertView.removeFullViewActivityIndicator(self.view)
            }
        })
    }
    

}
