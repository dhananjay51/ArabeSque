//
//  EventDetailVC.swift
//  ArabeSque
//
//  Created by DS on 23/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
import SkyFloatingLabelTextField
class EventDetailVC: UIViewController , UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var menuTable:UITableView!
     var Category_List:[EventCategory] = []
    var data:EventCategory?
     var selectcategory:String?
    let picker = UIPickerView()
    var toolBar = UIToolbar()
   let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
          self.title="Event Details"
        var nib = UINib.init(nibName: "EventCategoryCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "EventCategoryCell")
        nib = UINib.init(nibName: "EventTimeCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "EventTimeCell")
        nib = UINib.init(nibName: "UploadPicCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "UploadPicCell")
        nib = UINib.init(nibName: "EventpeCell", bundle: nil)
        self.menuTable.register(nib, forCellReuseIdentifier: "EventpeCell")
        
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
        // Do any additional setup after loading the view.
        picker.backgroundColor = .white
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        /// toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
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
        _ = navigationController?.popViewController(animated: true)
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
            
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "EventCategoryCell") as! EventCategoryCell
            
            cell.Category.rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image = UIImage(named: "dropdown")
            imageView.image = image
            cell.Category.rightView = imageView
            cell.selectionStyle = .none
            cell.Category.inputView = picker
            cell.Category.inputAccessoryView = toolBar
            cell.Category.text = selectcategory
           ///
            
            return cell
        }
        
        if indexPath.section==1
        {
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "EventTimeCell") as! EventTimeCell
             cell.selectionStyle = .none
            cell.Starttime.rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image = UIImage(named: "dropdown")
            imageView.image = image
            cell.Starttime.rightView = imageView
            
            
            datePicker.datePickerMode = .date
            
            //ToolBar
            let toolbar = UIToolbar();
            toolbar.sizeToFit()
            
            
            let doneButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelDatePicker))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donedatePicker))
            toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
            
              cell.Starttime.inputAccessoryView = toolbar
              cell.Starttime.inputView = datePicker
              cell.EndTime.inputAccessoryView = toolbar
              cell.EndTime.inputView = datePicker
            
            
            
            
            
            cell.EndTime.rightViewMode = UITextFieldViewMode.always
            let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image1 = UIImage(named: "dropdown")
            imageView1.image = image1
            cell.EndTime.rightView = imageView1
            return cell
            
        }
        
        if indexPath.section==2
        {
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "UploadPicCell") as! UploadPicCell
             cell.selectionStyle = .none
            return cell
            
        }
        else{
            let cell = self.menuTable.dequeueReusableCell(withIdentifier: "EventpeCell") as! EventpeCell
             cell.EventBtn.addTarget(self, action: #selector(EventReview), for: .touchUpInside)
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
            return 110.0
        }
            
        if indexPath.section==2
        {
            return 201.0
        }
        else {
            return 110.0
        }
        
        
        
    }
    @objc func EventReview(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReviewVC")
      
        self.navigationController?.pushViewController(vc!, animated: true)
        
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
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
       /// txtDatePicker.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    @objc func donePicker() {
        
        self.view.endEditing(true)
        
    }
     func getcategory(){
       
        let url = APPURL.GetEventCategoryUrl
                
                
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
                                    
                                    let api = EventCategory.init()
                                    
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
    

