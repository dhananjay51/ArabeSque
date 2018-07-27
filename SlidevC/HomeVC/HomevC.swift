//
//  HomevC.swift
//  SlidevC
//
//  Created by Macbook Pro on 30/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomevC: UIViewController , UITabBarDelegate, RecommendedDelegate {
    
    @IBOutlet weak var Exchnageview: UIView!
    @IBOutlet weak var GroupView: UIView!
    @IBOutlet weak var Peopleview: UIView!
    @IBOutlet weak var EventView: UIView!
    @IBOutlet weak var extbnt: UIButton!
    @IBOutlet weak var groupbtn: UIButton!
    @IBOutlet weak var peoplerbtn: UIButton!
    @IBOutlet weak var eventbtn: UIButton!
    @IBOutlet weak var tabbar :  CustomTabBar!
   @IBOutlet var Indicator: UIActivityIndicatorView!
     @IBOutlet weak var  Itemtable:UITableView!
     @IBOutlet weak var  MenuView:UIView!
     var checkvalue : String?
    fileprivate lazy var defaultTabBarHeight = { tabbar.frame.size.height }()
   
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 440, height: 44))
        searchBar.placeholder = "Search for Places"
        self.navigationItem.titleView = searchBar
        Exchnageview.isHidden=false
        GroupView.isHidden=true
        Peopleview.isHidden=true
        EventView.isHidden=true
         extbnt.isSelected = false
        groupbtn.isSelected = false
        peoplerbtn.isSelected = false
        eventbtn.isSelected = false
        self.tabbar.delegate=self
        tabbar.selectedItem = tabbar.items![2] as UITabBarItem
        tabbar.selectedItem?.title="LISTVIEW"
        
        
      
        
           
    // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        if  appDelegate.Servicebool==true  {
              extbnt.isSelected = true
              MenuView.isHidden = true
        }
        else{
            extbnt.isSelected = false
            MenuView.isHidden = false
               NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("Indicator"), object: nil)
              Indicator.startAnimating()
        }
    }
   
    
@objc func methodOfReceivedNotification(notification: Notification){
    Indicator.stopAnimating()
     Indicator.isHidden = true
    
}
@IBAction func tapButton(_ sender: Any) {
    
   let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    
    
}
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    @IBAction func Account(_ sender: Any) {
        let Accountvc = self.storyboard?.instantiateViewController(withIdentifier: "AccountVC") as! AccountVC
        self.navigationController?.pushViewController(Accountvc, animated: true)
        
    }
    
    @IBAction func exButton(_ sender: Any) {
        
        Exchnageview.isHidden=false
        GroupView.isHidden=true
        Peopleview.isHidden=true
        EventView.isHidden=true
        extbnt.isSelected = true
        groupbtn.isSelected = false
        peoplerbtn.isSelected = false
        eventbtn.isSelected = false
        MenuView.isHidden = true
         tabbar.isHidden = false
       
         checkvalue = ""


    }
    @IBAction func groupButton(_ sender: Any) {
        
        Exchnageview.isHidden=true
        GroupView.isHidden=false
        Peopleview.isHidden=true
        EventView.isHidden=true
        extbnt.isSelected = false
        groupbtn.isSelected = true
        peoplerbtn.isSelected = false
        eventbtn.isSelected = false
        MenuView.isHidden = true
      
         checkvalue = "group"


    }
    @IBAction func peopleButton(_ sender: Any) {
        
        Exchnageview.isHidden=true
        GroupView.isHidden=true
        Peopleview.isHidden=false
        EventView.isHidden=true
        extbnt.isSelected = false
        groupbtn.isSelected = false
        peoplerbtn.isSelected = true
        eventbtn.isSelected = false
        MenuView.isHidden = true
      
         checkvalue = ""

    }
    @IBAction func eventButton(_ sender: Any) {
       
        Exchnageview.isHidden=true
        GroupView.isHidden=true
        Peopleview.isHidden=true
        EventView.isHidden=false
        extbnt.isSelected = false
        groupbtn.isSelected = false
        peoplerbtn.isSelected = false
        eventbtn.isSelected = true
        MenuView.isHidden = true
     
          checkvalue = "event"


    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
       // print("the selected index is : \(tabBar.items?.index(of: item))")
        if (tabBar.items?.index(of: item)) == 0 {
            showOptions()
        }
        else if (tabBar.items?.index(of: item)) == 1{
            
            
            
        }
        else if (tabBar.items?.index(of: item)) == 2{
            
            
            if item.title=="LISTVIEW"
            {
               
                item.title="GRIDVIEW"
                self.tabbar.items![2].selectedImage = UIImage(named: "gridviewslct")
                
                
            }
            else{
                item.title="LISTVIEW"
                
                self.tabbar.items![2].selectedImage = UIImage(named: "listviewslct")
            }
            
            NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil, userInfo: ["State":item.title ?? ""])
            
            }
        else{
            if checkvalue == "group"{
                let loginPageView = self.storyboard?.instantiateViewController(withIdentifier: "CreateGroupVC") as!CreateGroupVC
                self.navigationController?.pushViewController(loginPageView, animated: true)
            }
            
             else if checkvalue == "event"
            {
                let loginPageView = self.storyboard?.instantiateViewController(withIdentifier: "CreateEventVC") as! CreateEventVC
                self.navigationController?.pushViewController(loginPageView, animated: true)
            }
            }
            
       
    
  
    }
}

extension HomevC : UITableViewDelegate, UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if  indexPath.row==0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WallbannnerCell", for: indexPath) as! WallbannnerCell
            
            return cell
        }
        
        if indexPath.row==1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecoomendedItemCell", for: indexPath) as! RecoomendedItemCell
                   cell.delegate = self
            
            return cell
            
        }
        if  indexPath.row==2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RefreshCell", for: indexPath) as! RefreshCell
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReGroupCell", for: indexPath) as!ReGroupCell
           
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row==0 {
            return 153.0
        }
        if indexPath.row==1
        {
            return 247.0
        }
        if indexPath.row==2
         {
          return 140.0
     }
         else{
         return 168.0
            
        }
    }
    func getDetial(Api: ExchangeModel){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC")as? DetailVC
        vc?.Exchangedata = Api
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    func showOptions()
    {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        if App.isRunningOnIpad {
            if let popoverPresentationController = alert.popoverPresentationController {
                popoverPresentationController.sourceView = self.view
                popoverPresentationController.sourceRect = CGRect(x: self.view.frame.size.width-70, y: 106, width: 0, height: 0)
                popoverPresentationController.permittedArrowDirections = .up
            }
        }
        
        alert.addAction(UIAlertAction(title: "Latest", style: .default , handler:{ (UIAlertAction)in
            
            
            
        }))
        
        
        alert.addAction(UIAlertAction(title: "Oldest", style: .default , handler:{ (UIAlertAction)in
           
        }))
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: {
        })
        
        
        
    }
     func Mess ( a: String)   {
        
        AlertController.showAlert(title:"", message: a)
        
    }
    }
    
   
    

