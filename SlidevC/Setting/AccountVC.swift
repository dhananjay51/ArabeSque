//
//  AccountVC.swift
//  ArabeSque
//
//  Created by DS on 25/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SwiftyJSON

class AccountVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate{
    
    @IBOutlet weak var firstanmne:SkyFloatingLabelTextField!
    @IBOutlet weak var lastname: SkyFloatingLabelTextField!
    @IBOutlet weak var Emialid: SkyFloatingLabelTextField!
    @IBOutlet weak var dateofbirth:SkyFloatingLabelTextField!
    @IBOutlet weak var Country:SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var City:SkyFloatingLabelTextFieldWithIcon!
    var picker =  UIPickerView()
    var Country_list: [CountryModel] = []
    var data:CountryModel?
    var City_list: [CityModel] = []
     var Select_list: [CityModel] = []
    var Citydata:CityModel?
    var  CountryId:String?
     var  CityId:String?
   @IBOutlet weak var Selectmale:UIButton!
   @IBOutlet weak var  SelectFemale:UIButton!
    
    
     let datePicker = UIDatePicker()
    var toolbar = UIToolbar()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Basic Information"
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
      
        
     
        dateofbirth.rightViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let image = UIImage(named: "dropdown")
        imageView.image = image
        dateofbirth.rightView = imageView
        
        Country.rightViewMode = UITextFieldViewMode.always
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let image1 = UIImage(named: "dropdown")
        imageView1.image = image1
        Country.rightView = imageView1
        
        City.rightViewMode = UITextFieldViewMode.always
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let image2 = UIImage(named: "dropdown")
        imageView2.image = image2
        City.rightView = imageView2
        
        datePicker.datePickerMode = .date
        
        //ToolBar
         toolbar = UIToolbar()
         toolbar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donedatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        dateofbirth.inputAccessoryView = toolbar
        dateofbirth.inputView = datePicker
        
        
        ///let picker: UIPickerView
        
        picker = UIPickerView(frame: CGRect(x: 0, y:100 , width: view.frame.width, height: 210 ))
        picker.backgroundColor = .white
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        
        /// toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton1 = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        let spaceButton1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton1 = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton1, spaceButton1, doneButton1], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        Country.inputView = picker
        Country.inputAccessoryView = toolBar
        City.inputView = picker
        City.inputAccessoryView = toolBar
        Country.delegate = self;
        City.delegate = self
     
        
    displayAlertView.displayFullViewActivityIndicator(self.view)
        getUserinfo()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if  Country.isEditing {
             return  Country_list.count
        }
        else{
             return  Select_list.count
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if  Country.isEditing {
            data = Country_list [row]
            
            return data?.CountryName
        }
        else{
            Citydata = Select_list [row]
            
            return Citydata?.CityName
        }
       
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if  Country.isEditing {
            
            data = Country_list [row]
            
             Country.text = data?.CountryName
             CountryId = data?.CountryID
        }
        else{
             Citydata =   self.Select_list[row]
            
             City.text =  Citydata?.CityName
        }
       
    }
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
    
        //delegate met
        if  textField.tag==11  {
              City.text=""
              Select_list = []
            
            
            
        }
        else{
          
            
             for json in City_list {
             print(json)
               let id=json.CountryID
              if CountryId == id
              {
                 self.Select_list.append(json)
                
                picker.reloadAllComponents()
                
            }
             
              else{
                
                
                
                }
          
          
            
            
        }
        
    }
    }
    

@objc func backButtonTapped() {
        
    self.navigationController?.popViewController(animated: true)
    
}
    @IBAction func UpdatePasswordButton(_ sender: Any) {
        
        let passwordvc = self.storyboard?.instantiateViewController(withIdentifier: "EquacationVC") as! EquacationVC
        self.navigationController?.pushViewController(passwordvc, animated: true)
        
    }
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
         dateofbirth.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
     @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @objc func donePicker() {
        
      self.view.endEditing(true)
        
    }
    
     @IBAction func SelectGender(_ sender: UIButton)
     {
        if  sender.tag==10  {
              Selectmale.isSelected = true
             SelectFemale.isSelected = false
           
        }
        
        else{
            SelectFemale.isSelected = true
             Selectmale.isSelected = false
        }
        
     }
    
    func getUserinfo()  {
        
       let url = "http://api.goarabesque.com/api/User/UserInfo"
            
            let newTodo: [String: String] = [:]
            ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
                displayAlertView.removeFullViewActivityIndicator(self.view)
                
                DispatchQueue.main.async{
                    
                    
                  if let json:JSON =  JSON(responseData)
                        
                    {
                        
                        
                        let ApiList = json.dictionary
                        
                        if let DataArr = json["data"].dictionary{
                            
                            
                            if DataArr.count == 0 {
                                
                            }
                             let CountryData = DataArr["Countries"]?.array
                             let CityData = DataArr["Cities"]?.array
                            
                            for ApiJSON in CountryData! {
                                
                                let api = CountryModel.init()
                                
                                api.setJson(json: ApiJSON)
                                self.Country_list.append(api)
                                
                                
                                
                            }
                            for ApiJSON in CityData! {
                                
                                let api = CityModel.init()
                                
                                api.setJson(json: ApiJSON)
                                self.City_list.append(api)
                                
                                
                                
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


