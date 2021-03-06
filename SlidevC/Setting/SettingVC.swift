//
//  SettingVC.swift
//  ArabeSque
//
//  Created by Macbook Pro on 03/04/1940 Saka.
//  Copyright © 1940 Macbook Pro. All rights reserved.
//

import UIKit

class SettingVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var menuTable:UITableView!
    
    var ImageData :  NSArray = []
    var itemarr : NSArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Setting"
        ImageData=["menuwall", "menuservice","menutimeline","coin","menusetting","chat","menurefer","menufaq",
                   ""]
        itemarr = ["Arabesque Wall","Services","My Timeline","Arabesque Coins","Settings","Chat","Refer A Friend"," FAQ's"]
        
        var nib = UINib.init(nibName: "UserSetCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "UserSetCell")
        
        nib = UINib.init(nibName: "NotificationCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "NotificationCell")
        
        nib = UINib.init(nibName: "SetCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "SetCell")
        nib = UINib.init(nibName: "SettingCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "SettingCell")

        
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func backButtonTapped() {
        
       let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        DispatchQueue.global(qos: .utility).async {
            
            
            // do something time consuming here
            
            DispatchQueue.main.async {
                // now update UI on main thread
                appDelegate.setside()
                
            }
            
        }
      
        
    }
    // Do any additional setup after loading the view.


func numberOfSections(in tableView: UITableView) -> Int {
    
    // #warning Incomplete implementation, return the number of sections
    return 4
    
}


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if section==0
    {
        return 1
    }
    if section==1{
        
        return 1
    }
    if section==2{
        
        return 3
    }
    else{
        return 1
    }
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section==0{
        
        let cell = self.menuTable.dequeueReusableCell(withIdentifier: "UserSetCell") as!UserSetCell
          cell.selectionStyle = .none
        return cell
    }
    
    if indexPath.section==1
    {
        let cell = self.menuTable.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
        //cell.itemName?.text = itemarr[indexPath.row] as? String
         cell.selectionStyle = .none
        return cell
        
    }
        
  if indexPath.section==2
  { let cell = self.menuTable.dequeueReusableCell(withIdentifier: "SetCell") as! SetCell
      cell.selectionStyle = .none
    return cell
    
  }
    else{
        let cell = self.menuTable.dequeueReusableCell(withIdentifier: "SettingCell") as! SettingCell
         cell.name.text = "Changepassword"
      cell.selectionStyle = .none
        return cell
        
    }
    
    
}
    func   tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if indexPath.section==0
        {
            return
        }
        if indexPath.section==1
        {
            return
        }
        if indexPath.section==2
        {
            return
        }
        else {
            let vc  = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC")
            self.navigationController?.pushViewController(vc!, animated:true)
        }
        
    }

func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    if indexPath.section==0
    {
        return 221.0
    }
    if indexPath.section==1
    {
        return 110.0
    }
    if indexPath.section==2
    {
        return 88.0
    }
    else {
        return 52.0
    }
    
    
    
}
func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 4
    }
}
