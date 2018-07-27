//
//  PeoepleDetailsVC.swift
//  ArabeSque
//
//  Created by DS on 23/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class PeoepleDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
 @IBOutlet weak var peopleTable:UITableView!
//var PeopleDetail:[PeopleDetailModel] = []
    var PeopleDetail = [PeopleDetailModel]()
var Peopledata:PeopleModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        var nib = UINib.init(nibName: "peopleimageCell", bundle: nil)
        self.peopleTable.register(nib, forCellReuseIdentifier: "peopleimageCell")
        nib = UINib.init(nibName: "PeopleDetailCell", bundle: nil)
        self.peopleTable.register(nib, forCellReuseIdentifier: "PeopleDetailCell")
        
        self.title = "People Details"
        
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
        displayAlertView.displayFullViewActivityIndicator(self.view)
         getUserDetail()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func backButtonTapped() {
        _ = navigationController?.popToRootViewController(animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
       return 2
        
   }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
             return  PeopleDetail.count
        }
        else {
              return PeopleDetail.count;
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0{
            
            let cell = self.peopleTable.dequeueReusableCell(withIdentifier: "peopleimageCell") as! peopleimageCell
            
           
            ///
             cell.configureCell(Api:PeopleDetail[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        
        
        else{
            let cell = self.peopleTable.dequeueReusableCell(withIdentifier: "PeopleDetailCell") as! PeopleDetailCell
            
            cell.selectionStyle = .none
            cell.configureCell(Api:PeopleDetail[indexPath.row])
            return cell
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section==0
        {
            return 269.0
        }
        else{
            return 407.0
        }
        
        
        }
    func getUserDetail()  {
        
        let url = APPURL.PeoPleDetailUrl + "T=1008&ID=\(Peopledata?.UserId ?? "")"
        
        
        let newTodo: [String: String] = [:]
        ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
            displayAlertView.removeFullViewActivityIndicator(self.view)
            
            DispatchQueue.main.async{
                
                
                let data =  responseData
                
                let Data = data!["data"] as! NSDictionary
                        
                        
                    
                let  userDict = Data["User"]as! NSDictionary
                let  Userinfo = userDict["BasicInfo"]as! NSDictionary
                        
                        
                            
                let api = PeopleDetailModel.init(parameters:Userinfo as! [String : Any])
                            
                
                  self.PeopleDetail.append(api)
                            
                   print(self.PeopleDetail)
                   self.peopleTable.reloadData()
                        
                      
                    }
                    
            
                    
                    
                }
                    
        }

}



            
        

        



