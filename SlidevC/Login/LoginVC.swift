//
//  LoginVC.swift
//  SlidevC
//
//  Created by Macbook Pro on 30/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FacebookCore
import FacebookLogin
import FBSDKLoginKit
import TwitterKit



class LoginVC: UIViewController,GIDSignInDelegate, GIDSignInUIDelegate {

     @IBOutlet weak var forbtn: UIButton!
    @IBOutlet weak var Signwtlabel: UILabel!
    @IBOutlet weak var  Email:SkyFloatingLabelTextField!
    @IBOutlet weak var  Password:SkyFloatingLabelTextField!
     @IBOutlet weak var Checkbtn: UIButton!
    
      var dict : [String : AnyObject]!
     var viewModel = LoginViewModel(model: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attrString = NSAttributedString(string: "Forgot password?", attributes: [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
         self.forbtn.setAttributedTitle(attrString, for: .normal)
        
       

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
    @IBAction func SignInBtn(_ sender: Any) {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.setside()
      /// Login()
      
    }
    
    func  Login()  {
      
        viewModel.useremail = Email.text!
        viewModel.password = Password.text!
     
        viewModel.checmaark = "true"
          displayAlertView.displayFullViewActivityIndicator(view)
        
        viewModel.signIn(checkValidation: true, completion: {
            (response) in
              displayAlertView.removeFullViewActivityIndicator(self.view)
            switch response {
            case .success(_)://Show alert msg for success
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.setside()
            case .error(let msg)://Show alert msg for failure
                AlertController.showAlert(title: Alert.Title.login, message: msg)
                  displayAlertView.removeFullViewActivityIndicator(self.view)
            }
        })
    }
    
    
    
@IBAction func ForgotPassbtn(_ sender: Any) {
        let vc=self.storyboard?.instantiateViewController(withIdentifier: "ForgotPVC")
        self.navigationController?.pushViewController(vc!, animated:true)
    }
    
    
    @IBAction func faceBookLoginBtnAction(_ sender: Any) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self) { (result, error) in
        if (error == nil){
        let fbloginresult : FBSDKLoginManagerLoginResult = result!
        if fbloginresult.grantedPermissions != nil {
        if(fbloginresult.grantedPermissions.contains("email")) {
            if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                    if (error == nil){
                        self.dict = result as! [String : AnyObject]
                        print(result!)
                            print(self.dict)
                                }
                            })
                        }
                    }
                }
            }
        }
}
    
  @IBAction func logimByGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    //MARK:- Google Delegate
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                     withError error: Error!) {
        
        if (error == nil) {
            print("User\(user)")
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            //let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            //let givenName = user.profile.givenName
            //let familyName = user.profile.familyName
            let email = user.profile.email
             print(user.profile.email)
          
            }
        else {
            print("\(error)")
        }
    }
    @IBAction func logimBYLinked(_ sender: Any) {
        let Accountvc = self.storyboard?.instantiateViewController(withIdentifier: "LinkedVC") as! LinkedVC
      //  self.navigationController?.pushViewController(Accountvc, animated: true)
        self.present(Accountvc, animated: true, completion: nil)
    }
    
    @IBAction func logimByTwitter(_ sender: Any) {

        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print("signed in as \(session?.userName)");
            } else {
                print("error: \(error?.localizedDescription)");
            }
        })

}

}

