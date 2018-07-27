//
//  ViewController.swift
//  SlidevC
//
//  Created by Macbook Pro on 30/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Loginview: UIView!
    @IBOutlet weak var RegisterView: UIView!
    @IBOutlet weak var loginbtn: UILabel!
    @IBOutlet weak var  Registerbtn: UILabel!
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Loginview.isHidden=false;
        self.RegisterView.isHidden=true
        self.loginbtn.isHidden = false
        
        self.Registerbtn.isHidden = true

       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.navigationBar.isHidden = true
    }

    
    @IBAction func RegsiterBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations:
            {
                self.Loginview.isHidden=true
                self.RegisterView.isHidden = false
                self.loginbtn.isHidden = true
                self.Registerbtn.isHidden = false

                
        })
        
        
    }
    @IBAction func Login(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations:
            {
                ///self.Loginview.alpha=0.0
                //self.RegisterView.alpha=1.0
                self.Loginview.isHidden=false;
                 self.RegisterView.isHidden=true
                self.loginbtn.isHidden = false
              
                self.Registerbtn.isHidden = true
                
        })
        

    }
}

