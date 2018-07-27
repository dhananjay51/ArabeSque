//
//  PeopleVC.swift
//  SlidevC
//
//  Created by Macbook Pro on 31/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
class PeopleVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet  weak var Peopletable:UITableView!
    @IBOutlet weak var Colllectionview:UIView!
    @IBOutlet weak var  GroupCollcetion:UICollectionView!
    
    
    var People_List:[PeopleModel] = []
    var PeopleListPageIndex:Int = 1
    var is_data_finished_fromServer:Bool = false
    var is_requesting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "PoepleCell", bundle: nil)
        self.Peopletable.register(nib, forCellReuseIdentifier: "PoepleCell")
        
        
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
        // Do any additional setup after loading the view.
        if    People_List.count == 0
        {
            displayAlertView.displayFullViewActivityIndicator(self.view)
            getPeopelList(pi: PeopleListPageIndex)
        }
        self.Peopletable.tableFooterView = UIView.init(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func methodOfReceivedNotification(notification: Notification){
        
        if let title = notification.userInfo?["State"] as? String{
            if title=="LISTVIEW"{
                Colllectionview.isHidden = true
                self.Peopletable.isHidden = false
                 self.Peopletable.reloadData()
            }
            else{
               self.Peopletable.isHidden = true
                Colllectionview.isHidden = false
               GroupCollcetion.reloadData()
            }
            
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return  People_List.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = self.Peopletable.dequeueReusableCell(withIdentifier: "PoepleCell") as! PoepleCell
        
        cell.selectionStyle = .none
        
          cell.configureCell(Api: People_List[indexPath.row])
        
         return cell
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PeoepleDetailsVC")as! PeoepleDetailsVC
          vc.Peopledata =  People_List[indexPath.row]
          self.navigationController?.pushViewController(vc, animated: true)
      
        
    }
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 90.0
        
        }
    
    // Collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  People_List.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = self.GroupCollcetion.dequeueReusableCell(withReuseIdentifier: "GruopCollectionCell", for: indexPath) as! GruopCollectionCell
        
         cell.configureCell(Api: People_List[indexPath.row])
       
        
       
        return cell
        
    }
    
    private func getPeopelList(pi:Int)  {
        
        
        if is_requesting == false && is_data_finished_fromServer == false
        {
            is_requesting  = true
            if People_List.count > 0 {
                self.Peopletable.tableFooterView = ViewUtils.getTableFooterLoaderView()
            }
            
            
            let url =
            APPURL.People + "T=1008&pi=\(pi)&ty=All&searchPhrase=&my=false&LocationIDs=&Distance=5&UserInterestIDs=0"
            
            
            
            let newTodo: [String: String] = [:]
            ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
                displayAlertView.removeFullViewActivityIndicator(self.view)
                
                DispatchQueue.main.async{
                    self.is_requesting  = false
                    
                    let data =  responseData
                    
                    
                    if let json:JSON =  JSON(responseData)
                        
                    {
                        self.PeopleListPageIndex = self.PeopleListPageIndex + 1
                        
                        let ApiList = json.dictionary
                        
                        if let DataArr = json["data"].array{
                            
                            
                            if DataArr.count == 0 {
                                
                                self.is_data_finished_fromServer = true
                            }
                            
                            
                            for ApiJSON in DataArr {
                                
                                let api = PeopleModel.init()
                                
                                api.setJson(json: ApiJSON)
                                self.People_List.append(api)
                                
                            }
                            
                            
                        }
                        
                        self.Peopletable.dataSource = self
                        self.Peopletable.delegate = self
                        self.Peopletable.reloadData()
                        self.Peopletable.tableFooterView = nil
                        
                    }
                    
                    
                }
                
                
                
            }
            
            
        }
            
        else{
            print("unable to fetch some broker list")
        }
    }
    

}
