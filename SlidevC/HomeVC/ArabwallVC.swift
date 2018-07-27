//
//  ArabwallVC.swift
//  ArabeSque
//
//  Created by DS on 23/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
class ArabwallVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var ArabwWallTable :UITableView!
      var Wall_List:[WallModel] = []
    var wallListPageIndex:Int = 1
    var is_data_finished_fromServer:Bool = false
    var is_requesting:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
          self.title = "Arabesques  Culture  Wall"
        let nib = UINib.init(nibName: "AraveWallCell", bundle: nil)
        self.ArabwWallTable.register(nib, forCellReuseIdentifier: "AraveWallCell")
        // Do any additional setup after loading the view.
        
        let filterButton = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(filterTapped)) //
        self.navigationItem.rightBarButtonItem = filterButton
        
        
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem = customButton
        
        
        if    Wall_List.count == 0
        {
            displayAlertView.displayFullViewActivityIndicator(self.view)
            getExchnageList(pi: wallListPageIndex)
        }
         self.ArabwWallTable.tableFooterView = UIView.init(frame: CGRect.zero)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backButtonTapped() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.setside()
        
}
    @objc func filterTapped() {
        
       
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
            return  Wall_List.count
        }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
            let cell = self.ArabwWallTable.dequeueReusableCell(withIdentifier: "AraveWallCell") as! AraveWallCell
          cell.CellConfi(Api: Wall_List[indexPath.row])
         cell.selectionStyle = .none
        if indexPath.row ==  Wall_List.count - 2 {
            
            getExchnageList(pi:wallListPageIndex)
        }
            return cell
            
        }
        
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
   
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
       
            return 360.0
        }
    
    
   private func getExchnageList(pi:Int)  {
        
        
        if is_requesting == false && is_data_finished_fromServer == false
        {
            is_requesting  = true
            if Wall_List.count > 0 {
                self.ArabwWallTable.tableFooterView = ViewUtils.getTableFooterLoaderView()
            }
            
            
            let url = APPURL.GetWallPostsUrl + "T=1008&pi=\(pi)&searchPhrase=&CategoryIDs=1&UserInterestIDs=&LocationIDs=&Distance=0&SortBy=Latest&Latitude=&Longitude="
            
            
            
            let newTodo: [String: String] = [:]
            ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
                displayAlertView.removeFullViewActivityIndicator(self.view)
                
                DispatchQueue.main.async{
                    self.is_requesting  = false
                    
                  
                    
                    
                    if let json:JSON =  JSON(responseData)
                        
                    {
                        self.wallListPageIndex = self.wallListPageIndex + 1
                        
                    
                        
                        if let DataArr = json["data"].array{
                            
                            
                            if DataArr.count == 0 {
                                
                                self.is_data_finished_fromServer = true
                            }
                            
                            
                            for ApiJSON in DataArr {
                                
                                let api = WallModel.init()
                                
                                api.setJson(json: ApiJSON)
                                
                                self.Wall_List.append(api)
                                
                            }
                            
                            
                        }
                        
                        self.ArabwWallTable.dataSource = self
                        self.ArabwWallTable.delegate = self
                        self.ArabwWallTable.reloadData()
                        self.ArabwWallTable.tableFooterView = nil
                        
                    }
                    
                    
                }
                
                
                
            }
            
            
        }
            
        else{
            print("unable to fetch some broker list")
        }
    }
    
        
    }
