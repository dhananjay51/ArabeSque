//
//  TimeLineVC.swift
//  ArabeSque
//
//  Created by DS on 28/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import PageMenu
class TimeLineVC: UIViewController,CAPSPageMenuDelegate {
   var pageMenu : CAPSPageMenu?
  @IBOutlet weak var TimeTable:UITableView!
  ///  @IBOutlet weak var MenuItem:UIView!

     
    override func viewDidLoad() {
        super.viewDidLoad()
          self.title = "Time Line"
    ///  let   nib = UINib.init(nibName: "ItemCell", bundle: nil)
        ///self.TimeTable.register(nib, forCellReuseIdentifier: "ItemCell")
       
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
       
      setupPages()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
@objc func backButtonTapped() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.setside()
        
    }
    func setupPages() {
        var controllerArray: [UIViewController] = []
        let Group =  storyboard?.instantiateViewController(withIdentifier: "ExchageVC") as! ExchageVC
        Group.title = "Exchange"
        
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "GroupVC") as! GroupVC
        secondVC.title = "Group"
        
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "PeopleVC") as! PeopleVC
        thirdVC.title = "People"
        let FourthVC = storyboard?.instantiateViewController(withIdentifier: "PeopleVC") as! PeopleVC
        FourthVC.title = "Event"
        
        controllerArray.append(Group)
        controllerArray.append(secondVC)
        controllerArray.append(thirdVC)
         controllerArray.append(FourthVC)
        
        let dividerCount:CGFloat = 4
        let item_width = ScreenSize.SCREEN_WIDTH / dividerCount
       /// var font = UIFont.Roboto.Regular(size: 10*screenScaleFactor)
        var indicatorHeight:CGFloat = 2
        var menuHeight:CGFloat = 40
        var menuMargin:CGFloat = 5.0
        var menuSeparaterWidth:CGFloat = 4.3
        if App.isRunningOnIpad {
           /// font = UIFont.Roboto.Regular(size: 20*screenScaleFactor)
            indicatorHeight = 5
            menuHeight = 80
            menuMargin = 10
            menuSeparaterWidth = 8.0
        }
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(menuSeparaterWidth),
            .scrollMenuBackgroundColor(UIColor(red: 25.0/255.0, green: 83.0/255.0, blue: 136.0/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor(red: 25.0/255.0, green: 83.0/255.0, blue: 136.0/255.0, alpha: 1.0)),
            .bottomMenuHairlineColor(UIColor.white),
            .selectionIndicatorColor(UIColor(red: 234.0/255.0, green: 45.0/255.0, blue: 103.0/255.0, alpha: 1.0)),
            
         
            .menuMargin(menuMargin),
            .menuHeight(menuHeight),
            .menuItemWidth(item_width),
            .selectedMenuItemLabelColor(UIColor.white),
            .unselectedMenuItemLabelColor(UIColor.lightGray),
           // .menuItemFont(font),
            //.useMenuLikeSegmentedControl(false),
            //.menuItemSeparatorRoundEdges(true),
            .centerMenuItems(true),
            .selectionIndicatorHeight(indicatorHeight),
            .menuItemSeparatorPercentageHeight(0.1)
           
           
        ]
        
        
        
        // Initialize scroll menu
        
      
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 300, width: ScreenSize.SCREEN_WIDTH, height: self.view.frame.height), pageMenuOptions: parameters)
        
        
        // Optional delegate
            pageMenu!.delegate = self
        
        self.view.addSubview(pageMenu!.view)
        
    }
    
        
        
    

}
