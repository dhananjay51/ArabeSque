//
//  GroupDetailVC.swift
//  ArabeSque
//
//  Created by DS on 27/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class GroupDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate {
    var selectcategory: String?
    
 @IBOutlet weak var menuTable:UITableView!
    
    var Category_List:[GroupCategory] = []
    var data:GroupCategory?
    let picker = UIPickerView()
    var toolBar = UIToolbar()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Group Details"
        var nib = UINib.init(nibName: "GroupCategoryCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "GroupCategoryCell")
        nib = UINib.init(nibName: "UploadPicCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "UploadPicCell")
        nib = UINib.init(nibName: "GroupAppCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "GroupAppCell")
        nib = UINib.init(nibName: "GroupMakeCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "GroupMakeCell")
        
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
        
        picker.backgroundColor = .white
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
    
        toolBar.sizeToFit()
        
        let doneButton1 = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        let spaceButton1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton1 = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton1, spaceButton1, doneButton1], animated: false)
        toolBar.isUserInteractionEnabled = true
          getcategory()

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
            
            return 1
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0{
            
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "GroupCategoryCell") as! GroupCategoryCell
            cell.SelectCategory.rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image = UIImage(named: "dropdown")
            imageView.image = image
             cell.SelectCategory.rightView = imageView
              cell.selectionStyle = .none
        cell.SelectCategory.inputView = picker
        cell.SelectCategory.inputAccessoryView = toolBar
        cell.SelectCategory.text = selectcategory
             
            return cell
        }
        
        if indexPath.section==1
        {
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "UploadPicCell") as! UploadPicCell
             cell.selectionStyle = .none
            return cell
            
        }
        
        if indexPath.section==2
        {
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "GroupAppCell") as! GroupAppCell
             cell.selectionStyle = .none
            cell.publicbtn.addTarget(self, action: #selector(publicbtn), for: .touchUpInside)
                cell.publicbtn.isSelected = true
             cell.Privatebtn.addTarget(self, action: #selector(Privatebtn), for: .touchUpInside)
            
            /// cell.addTarget(self, action: #selector(GroupReview), for: .touchUpInside)
            return cell
            
        }
        else{
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "GroupMakeCell") as! GroupMakeCell
            cell.GroupBtn.addTarget(self, action: #selector(GroupReview), for: .touchUpInside)
              cell.selectionStyle = .none 
            
            return cell
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section==0
        {
            return 190.0
        }
        if indexPath.section==1
        {
            return 210.0
        }
        
        if indexPath.section==2
        {
            return 76.0
        }
        else {
            return 152.0
        }
        
        
        
    }
    @objc func GroupReview(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReviewVC")
        //self.navigationController?.pushViewController( vc!, animated: true)
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
     @objc func publicbtn(sender: UIButton)
     {
        if  sender.isSelected == true {
             sender.isSelected = false
        }
        else{
            sender.isSelected = true
        }
        
    }
     @objc func Privatebtn(sender: UIButton)
    {
    
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return Category_List.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        data = Category_List[row]
        
        return data?.Category
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
        data = Category_List[row]
        selectcategory = data?.Category
        let indexPath = IndexPath(item: 0, section: 0)
        menuTable.reloadRows(at: [indexPath], with: .fade)
    }
    
    
    @objc func donePicker() {
        
        self.view.endEditing(true)
        
    }
    func getcategory(){
        
        let url = APPURL.GetGroupCategory
        
        
        let newTodo: [String: String] = [:]
        ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
            displayAlertView.removeFullViewActivityIndicator(self.view)
            
            DispatchQueue.main.async{
                
                
                let data =  responseData
                
                
                if let json:JSON =  JSON(responseData)
                    
                {
                    
                    
                    let ApiList = json.dictionary
                    
                    if let DataArr = json["data"].array{
                        
                        
                        if DataArr.count == 0 {
                            
                        }
                        
                        
                        for ApiJSON in DataArr {
                            
                            let api = GroupCategory.init()
                            
                            api.setJson(json: ApiJSON)
                            self.Category_List.append(api)
                            
                        }
                        
                        self.picker .reloadAllComponents()
                    }
                    
                    
                    
                }
                    
                    
                else{
                    print("unable to fetch some broker list")
                }
            }
        }
        
    }
    
}
