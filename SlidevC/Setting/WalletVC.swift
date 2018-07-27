//
//  WalletVC.swift
//  ArabeSque
//
//  Created by DS on 25/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class WalletVC: UIViewController , UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var walletTabel:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib.init(nibName: "WalletCell", bundle: nil)
        self.walletTabel.register(nib, forCellReuseIdentifier: "WalletCell")
        
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
        
        self.title = "ArabeSque Coins"
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
    @objc func filterTapped() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.setside()
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
            return 6
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
            let cell = self.walletTabel.dequeueReusableCell(withIdentifier: "WalletCell") as! WalletCell
              cell.selectionStyle = .none
            return cell
            
        
        
        
    }
    
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
            return 74.0
        
        
        
        
    }


}
