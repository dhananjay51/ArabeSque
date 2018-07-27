//
//  SideMenuvC.swift
//  SlidevC
//
//  Created by Macbook Pro on 30/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit

class SideMenuvC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var menuTable:UITableView!
   
var ImageData :  NSArray = []
    var itemarr : NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         ImageData=["home","menuwall", "menuservice","menutimeline","coin","menusetting","chat","menurefer","menufaq",
                    ""]
        itemarr = ["Home","Arabesque Wall","Services","My Timeline","Arabesque Coins","Settings","Chat","Refer A Friend"," FAQ's"]
        
        var nib = UINib.init(nibName: "ImageCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "ImageCell")
         nib = UINib.init(nibName: "menuItemCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "menuItemCell")
         nib = UINib.init(nibName: "NewUserCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "NewUserCell")
      self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
     self.navigationController?.navigationBar.isHidden = true
        
       
    
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
         return 3
        
        
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         if section==0
         {
            return 1
        }
          if section==1{
            
            return itemarr.count
        }
         else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0{
        
         let cell = self.menuTable.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
              cell.selectionStyle = .none
        
          return cell
        }
        
         if indexPath.section==1
        {
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "menuItemCell") as! menuItemCell
            cell.itemName?.text = itemarr[indexPath.row] as? String
            let img = ImageData[ indexPath.row]as?String
            cell.imageicon?.image = UIImage(named: img!)
            cell.selectionStyle = .none
         
            return cell
            
        }
        else{
            
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "NewUserCell") as! NewUserCell
              cell.selectionStyle = .none
            return cell

        }
        
        
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section==0
        {
            return 119.0
        }
        if indexPath.section==1
        {
            return 60.0
        }
        else {
            return 220
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
   if indexPath.section==1 {
    if indexPath.row==0
    {
        
        let Home = self.storyboard?.instantiateViewController(withIdentifier: "HomevC") as! HomevC
        let NavController = UINavigationController(rootViewController: Home)
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.Servicebool = false
        appDelegate.centerContainer!.centerViewController = NavController
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        
 }
    else if indexPath.row == 1{
         let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "ArabwallVC") as! ArabwallVC
         let aboutNavController = UINavigationController(rootViewController: aboutViewController)
         let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
         
        appDelegate.centerContainer!.centerViewController = aboutNavController
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        
    }
            
    else if indexPath.row == 2
             {
    let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomevC") as! HomevC
        let aboutNavController = UINavigationController(rootViewController: aboutViewController)
                
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
     appDelegate.Servicebool = true
                
    appDelegate.centerContainer!.centerViewController = aboutNavController
   appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
                
    else if indexPath.row == 3    {
    let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "TimeLineVC") as! TimeLineVC
    let aboutNavController = UINavigationController(rootViewController: aboutViewController)
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
     appDelegate.centerContainer!.centerViewController = aboutNavController
    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
 ///self.navigationController?.pushViewController(aboutViewController, animated: true)
        
    }
                
else if indexPath.row == 4
{
let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "WalletVC") as! WalletVC
 let aboutNavController = UINavigationController(rootViewController: aboutViewController)
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.centerViewController = aboutNavController
  appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    
    }
else if indexPath.row == 5
 {
let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
    let aboutNavController = UINavigationController(rootViewController: aboutViewController)
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.centerViewController = aboutNavController
appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
        
    else if indexPath.row == 6
    {
        let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        let aboutNavController = UINavigationController(rootViewController: aboutViewController)
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.centerViewController = aboutNavController
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
        
    else if indexPath.row == 7
    {
    let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "ReferFriendVC") as! ReferFriendVC
    let aboutNavController = UINavigationController(rootViewController: aboutViewController)
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.centerContainer!.centerViewController = aboutNavController
  appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
        
   else{
        
        let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "AboutvC") as! AboutvC
    let aboutNavController = UINavigationController(rootViewController: aboutViewController)
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.centerContainer!.centerViewController = aboutNavController
    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)

    
        }
        
        }
        
    }
   
    

   }
