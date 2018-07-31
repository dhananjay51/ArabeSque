//
//  ExchageVC.swift
//  SlidevC
//
//  Created by Macbook Pro on 31/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class ExchageVC: UIViewController,UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
      var Exchange_List:[ExchangeModel] = []
     var ExhangeListPageIndex:Int = 1
    var is_data_finished_fromServer:Bool = false
    var is_requesting:Bool = false
    var Subtitle:String = "All"
    
    
    
    @IBOutlet weak var exchangeTable:UITableView!
    @IBOutlet weak var Colllectionview:UIView!
    @IBOutlet weak var  ExchangeCollcetion:UICollectionView!
    @IBOutlet var ScrollView: UIScrollView!
          var itemarr : NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         itemarr = ["ALL PRODUCT","SELL ONLY","EXCHNAGE/BARTER","EXCHANGE/SERVICE","GIFT?CHARITY"]
        
        let nib = UINib.init(nibName: "ExchangeCell", bundle: nil)
        self.exchangeTable.register(nib, forCellReuseIdentifier: "ExchangeCell")
        
        self.ExchangeCollcetion.register (UINib(nibName: "ExchangeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ExchangeCollectionCell")
        
          dynamicButtonCreation()
      
        
        
        let width = (view.frame.width-17)/2
        let layout  = ExchangeCollcetion.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height:260 )
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        ExchangeCollcetion!.collectionViewLayout = layout
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
        
         NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfItemNotification(notification:)), name: Notification.Name("Search"), object: nil)
        
          NotificationCenter.default.addObserver(self, selector: #selector(self.ReloadItemNotification(notification:)), name: Notification.Name("Final"), object: nil)
        
        if   Exchange_List.count == 0
        {
          displayAlertView.displayFullViewActivityIndicator(self.view)
              getExchnageList(pi: ExhangeListPageIndex, Sub: Subtitle)
        }
         self.exchangeTable.tableFooterView = UIView.init(frame: CGRect.zero)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func methodOfItemNotification(notification: Notification)
    
    {
       is_requesting = false
        is_data_finished_fromServer = false
        
            Exchange_List = []
         let title = notification.userInfo?["Search"] as? String
        
     
          getExchnageList(pi: 1, Sub:  Subtitle, Search: title!)
        
         
        
    }
    
    @objc func ReloadItemNotification(notification: Notification)
        
        
    { 
        Exchange_List = []
        is_requesting = false
        is_data_finished_fromServer = false
         getExchnageList(pi: 1, Sub: Subtitle)
        
    }
    
    
    func dynamicButtonCreation() {
        
        ScrollView.isScrollEnabled = true
        ScrollView.isUserInteractionEnabled = true
        ScrollView.showsHorizontalScrollIndicator = false
        
        var count = 0
        var px = 0
        var Button:UIButton!
        for j in 1...itemarr.count {
            count += 1
            
            Button = UIButton()
           
            if let font = UIFont(name: "SegoeUI", size: 10) {
                let fontAttributes = [NSAttributedStringKey.font: font]
                let myText = itemarr[j-1] as? String
                let size = (myText! as NSString).size(withAttributes: fontAttributes)
            
            Button.tag = count
                Button.frame = CGRect(x: px+10, y: 5, width: Int(size.width+30), height: 40)
            
            }
            Button.titleLabel?.font =  UIFont(name: "SegoeUI", size: 10)
            Button.setTitle(itemarr[j-1] as? String, for: .normal)
            
            
            if Button.tag==1{
                Button.layer.borderColor = UIColor.blue.cgColor
                
                Button.setTitleColor(.black, for: .normal)
                Button.isSelected = true
            }
            else{
                Button.layer.borderColor = UIColor.black.cgColor
                
                Button.setTitleColor(.black, for: .normal)
                
                
            }
            Button.addTarget(self, action: #selector(scrollButtonAction), for: .touchUpInside)
            ScrollView.addSubview(Button)
            Button.backgroundColor = .clear
            Button.layer.cornerRadius = 5
            Button.layer.borderWidth = 1
           /// Button.layer.borderColor = UIColor.black.cgColor
            
            Button.setTitleColor(.black, for: .normal)
            px = px + Int(Button.frame.width)+10
           
        }
        ///}
        
        
        ScrollView.contentSize = CGSize(width: px, height: 50)
        
    }
    
    @objc func scrollButtonAction(sender: UIButton) {
       
        
        
        
        if sender.tag==1 {
            
            
              Subtitle = "All"
             ExhangeListPageIndex=1
            Exchange_List = []
               displayAlertView.displayFullViewActivityIndicator(self.view)
             getExchnageList(pi: ExhangeListPageIndex, Sub: Subtitle)
          
        }
        
      else if (sender.tag==2)
        {
            
          
            Subtitle = "All"
             ExhangeListPageIndex=1
              displayAlertView.displayFullViewActivityIndicator(self.view)
            Exchange_List = []
            getExchnageList(pi: ExhangeListPageIndex, Sub: Subtitle)
            
            
        }
        else if (sender.tag==3)
        {
           
            Subtitle = "Barter"
             ExhangeListPageIndex=1
             Exchange_List = []
              displayAlertView.displayFullViewActivityIndicator(self.view)
            getExchnageList(pi: ExhangeListPageIndex, Sub: Subtitle)
            
        }
        else if (sender.tag==4)
        {   
           
            Subtitle = "Services"
             ExhangeListPageIndex=1
             Exchange_List = []
              displayAlertView.displayFullViewActivityIndicator(self.view)
            getExchnageList(pi: ExhangeListPageIndex, Sub: Subtitle)
        }
        else
        {
            Subtitle = "Charity"
            Exchange_List = []
            ExhangeListPageIndex=1
              displayAlertView.displayFullViewActivityIndicator(self.view)
            getExchnageList(pi: ExhangeListPageIndex, Sub: Subtitle)
        }
        
        
    }
    
    
   
    
@objc func methodOfReceivedNotification(notification: Notification){
        
        if let title = notification.userInfo?["State"] as? String{
            if title=="LISTVIEW"{
                Colllectionview.isHidden = true
                exchangeTable.isHidden = false
                exchangeTable.reloadData()
            }
            else{
                exchangeTable.isHidden = true
                Colllectionview.isHidden = false
                ExchangeCollcetion.delegate=self;
                ExchangeCollcetion.dataSource=self;
                ExchangeCollcetion.reloadData()
            }
            
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
            return Exchange_List.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            let cell = self.exchangeTable.dequeueReusableCell(withIdentifier: "ExchangeCell") as! ExchangeCell
        
        
        cell.selectionStyle = .none
        
         cell.configureCell(Api: Exchange_List [indexPath.row])
        
        if indexPath.row ==  Exchange_List.count - 2 {
            
            getExchnageList(pi: ExhangeListPageIndex, Sub: Subtitle)
        }
        
        return cell
            
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC")as? DetailVC
         vc?.Exchangedata = Exchange_List [indexPath.row]
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.SelectController = "Ex"
        
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
            return 115
        
        
        
        
    }


// Collectionview
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return  Exchange_List.count
}

func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell  = self.ExchangeCollcetion.dequeueReusableCell(withReuseIdentifier: "ExchangeCollectionCell", for: indexPath) as! ExchangeCollectionCell
    
    
    var borderColor: CGColor! = UIColor.clear.cgColor
    var borderWidth: CGFloat = 0
    
    
    borderColor = UIColor.darkGray.cgColor
    borderWidth = 0.5 //or whatever you please
    
    
    cell.layer.borderWidth = borderWidth
    cell.layer.borderColor = borderColor
     cell.configureCell(Api: Exchange_List [indexPath.row])
   
    
    return cell
}
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 4, 10, 4)
    }
    
    
    //Api
    
    private func getExchnageList(pi:Int, Sub:String)  {
        
        
        if is_requesting == false && is_data_finished_fromServer == false
        {
            is_requesting  = true
            if Exchange_List.count > 0 {
                self.exchangeTable.tableFooterView = ViewUtils.getTableFooterLoaderView()
            }
       
            
        
         let url = APPURL.Exchange + "T=1008&pi=\(pi)&ty=\(Sub)&searchPhrase=&my=false&SortBy=Latest"
        
      
        
        let newTodo: [String: String] = [:]
        ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
            displayAlertView.removeFullViewActivityIndicator(self.view)
            
            DispatchQueue.main.async{
               self.is_requesting  = false
                
                let data =  responseData
                    
                    
                    if let json:JSON =  JSON(responseData)
                        
                    {
                        self.ExhangeListPageIndex = self.ExhangeListPageIndex + 1

                        let ApiList = json.dictionary
                        
                        if let DataArr = json["data"].array{
                           
                        
                         if DataArr.count == 0 {
                            
                            self.is_data_finished_fromServer = true
                        }
                        
                        
                            for ApiJSON in DataArr {
                            
                            let api = ExchangeModel.init()
                            
                              api.setJson(json: ApiJSON)
                              self.Exchange_List.append(api)
                            
                            }
                           
                           
                    }
                       
                        self.exchangeTable.dataSource = self
                        self.exchangeTable.delegate = self
                        self.exchangeTable.reloadData()
                        self.exchangeTable.tableFooterView = nil
                       
            }
                
                
            }
            
            
           
        }
            
       
        }
        
        else{
             print("unable to fetch some broker list")
        }
        }
    
    
    private func getExchnageList(pi:Int, Sub:String,Search:String)
    {
        
        
        if is_requesting == false && is_data_finished_fromServer == false
        {
            is_requesting  = true
            if Exchange_List.count > 0 {
                self.exchangeTable.tableFooterView = ViewUtils.getTableFooterLoaderView()
            }
        
    let url = APPURL.Exchange + "T=1008&pi=\(pi)&ty=\(Sub)&searchPhrase=\(Search)&my=false&SortBy=Latest"
    
    
    
    let newTodo: [String: String] = [:]
    ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
    displayAlertView.removeFullViewActivityIndicator(self.view)
    
    DispatchQueue.main.async{
    self.is_requesting  = false
    
    let data =  responseData
    
    
    if let json:JSON =  JSON(responseData)
    
    {
    self.ExhangeListPageIndex = self.ExhangeListPageIndex + 1
    
    let ApiList = json.dictionary
    
    if let DataArr = json["data"].array{
    
    
    if DataArr.count == 0 {
    
    self.is_data_finished_fromServer = true
    }
    
    
    for ApiJSON in DataArr {
    
    let api = ExchangeModel.init()
    
    api.setJson(json: ApiJSON)
    self.Exchange_List.append(api)
    
    }
    
    
    }
    
    self.exchangeTable.dataSource = self
    self.exchangeTable.delegate = self
    self.exchangeTable.reloadData()
    self.exchangeTable.tableFooterView = nil
    
    }
    
    
    }
    
    
    
    }
    
    
}

else{
    print("unable to fetch some broker list")
}
}
        
}



