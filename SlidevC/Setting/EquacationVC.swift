//
//  EquacationVC.swift
//  ArabeSque
//
//  Created by DS on 25/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class EquacationVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var Educationtable :UITableView!
     let datePicker = UIDatePicker()
      var toolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var nib = UINib.init(nibName: "EducationCell", bundle: nil)
        self.Educationtable.register(nib, forCellReuseIdentifier: "EducationCell")
        nib = UINib.init(nibName: "WorkExpCell", bundle: nil)
        self.Educationtable.register(nib, forCellReuseIdentifier: "WorkExpCell")
        nib = UINib.init(nibName: "ButtonCell", bundle: nil)
        self.Educationtable.register(nib, forCellReuseIdentifier: "ButtonCell")
        self.title = "Education & Work"
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
        
        datePicker.datePickerMode = .date
        
        //ToolBar
        toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donedatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        
       
        
      
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func backButtonTapped() {
        
       self.navigationController?.popViewController(animated: true)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
        return 3
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section==0
        {
            return 1
        }
        if section==1{
            
            return 1
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0{
            
            let cell = self.Educationtable.dequeueReusableCell(withIdentifier: "EducationCell") as! EducationCell
            
            
            cell.selectionStyle = .none
            cell.From.rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image = UIImage(named: "dropdown")
            imageView.image = image
            cell.From.rightView = imageView
            
            cell.To.rightViewMode = UITextFieldViewMode.always
            let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image1 = UIImage(named: "dropdown")
            imageView1.image = image1
            cell.To.rightView = imageView1
            
            cell.From.inputAccessoryView = toolbar
            cell.From.inputView = datePicker
            cell.To.inputAccessoryView = toolbar
            cell.To.inputView = datePicker
             
            return cell
        }
        
        if indexPath.section==1
        {
            let cell = self.Educationtable.dequeueReusableCell(withIdentifier: "WorkExpCell") as! WorkExpCell
            
            cell.selectionStyle = .none
            cell.From.rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image = UIImage(named: "dropdown")
            imageView.image = image
            cell.From.rightView = imageView
            
            cell.To.rightViewMode = UITextFieldViewMode.always
            let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image1 = UIImage(named: "dropdown")
            imageView1.image = image1
            cell.To.rightView = imageView1
           
            cell.selectionStyle = .none
            cell.From.inputAccessoryView = toolbar
            cell.From.inputView = datePicker
            cell.To.inputAccessoryView = toolbar
            cell.To.inputView = datePicker
            return cell
            
        }
        else{
            let cell = self.Educationtable.dequeueReusableCell(withIdentifier: "ButtonCell") as! ButtonCell
            cell.Changerbtn.addTarget(self, action: #selector(connected), for: .touchUpInside)
              cell.selectionStyle = .none
            return cell
            
        }
        
        
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section==0
        {
            return 263.0
        }
        if indexPath.section==1
        {
            return 263.0
        }
        else {
            return 48
        }
        
        
        
    }
    
    @objc func connected(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyinternetVC")
        //self.navigationController?.pushViewController( vc!, animated: true)
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
      ///  dateofbirth.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @objc func donePicker() {
        
        self.view.endEditing(true)
        
    }
}
