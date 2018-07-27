//
//  GroupVC.swift
//  SlidevC
//
//  Created by Macbook Pro on 31/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
class GroupVC: UIViewController ,UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var groupTable:UITableView!
    @IBOutlet weak var Colllectionview:UIView!
    @IBOutlet weak var  GroupCollcetion:UICollectionView!
    var Group_List:[GroupModel] = []
    var GroupListPageIndex:Int = 1
    var is_data_finished_fromServer:Bool = false
    var is_requesting:Bool = false


    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "GroupCell", bundle: nil)
        self.groupTable.register(nib, forCellReuseIdentifier: "GroupCell")
        
        self.GroupCollcetion.register (UINib(nibName: "GruopCollectionCell", bundle: nil), forCellWithReuseIdentifier: "GruopCollectionCell")
          /// groupTable.isHidden = true
        let width = (view.frame.width-18)/2
        let layout = GroupCollcetion.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: 160)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        GroupCollcetion!.collectionViewLayout = layout
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
        
        if    Group_List.count == 0
        {
            displayAlertView.displayFullViewActivityIndicator(self.view)
            getGroupList(pi: GroupListPageIndex)
        }
        self.groupTable.tableFooterView = UIView.init(frame: CGRect.zero)
        /// self.GroupCollcetion.coll = UIView.init(frame: CGRect.zero)

        // Do any additional setup after loading the view.
    }
    @objc func methodOfReceivedNotification(notification: Notification){
        
        if let title = notification.userInfo?["State"] as? String{
            if title=="LISTVIEW"{
                  Colllectionview.isHidden = true
                  groupTable.isHidden = false
                   groupTable.reloadData()
            }
            else{
                 groupTable.isHidden = true
                  Colllectionview.isHidden = false
                 GroupCollcetion.reloadData()
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return Group_List.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = self.groupTable.dequeueReusableCell(withIdentifier: "GroupCell") as! GroupCell
        
       cell.configureCell(Api: Group_List [indexPath.row])
        if indexPath.row ==   Group_List.count - 2 {
            
            getGroupList(pi: GroupListPageIndex)
        }
          cell.selectionStyle = .none
          return cell
        
    
    
    
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
    
}
func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    
    return 118
    
    
    
    
}
// Collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  Group_List.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = self.GroupCollcetion.dequeueReusableCell(withReuseIdentifier: "GruopCollectionCell", for: indexPath) as! GruopCollectionCell
        
          cell.configureCell(Api: Group_List[indexPath.row])
        if indexPath.row ==   Group_List.count - 2 {
            
            getGroupList(pi: GroupListPageIndex)
        }
        
      
        return cell
    }
    
    //Api
    
    private func getGroupList(pi:Int)  {
        
        
        if is_requesting == false && is_data_finished_fromServer == false
        {
            is_requesting  = true
            if  Group_List.count > 0 {
                self.groupTable.tableFooterView = ViewUtils.getTableFooterLoaderView()
                   
                
            }
            
            
            let url = APPURL.Group + "T=1008&pi=\(pi)&ty=All&searchPhrase=&my=true"
            
            
            let newTodo: [String: String] = [:]
            ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
                displayAlertView.removeFullViewActivityIndicator(self.view)
                
                DispatchQueue.main.async{
                    self.is_requesting  = false
                    
                    let data =  responseData
                    
                    
                    if let json:JSON =  JSON(responseData)
                        
                    {
                        self.GroupListPageIndex = self.GroupListPageIndex + 1
                        
                        let ApiList = json.dictionary
                        
                        if let DataArr = json["data"].array{
                            
                            
                            if DataArr.count == 0 {
                                
                                self.is_data_finished_fromServer = true
                            }
                            
                            
                            for ApiJSON in DataArr {
                                
                                let api = GroupModel.init()
                                
                                api.setJson(json: ApiJSON)
                                self.Group_List.append(api)
                                
                            }
                            
                            
                        }
                        
                        self.groupTable.dataSource = self
                        self.groupTable.delegate = self
                        self.groupTable.reloadData()
                        self.groupTable.tableFooterView = nil
                        
                    }
                    
                    
                }
                
                
                
            }
            
            
        }
            
        else{
            print("unable to fetch some broker list")
        }
    }
    
}
