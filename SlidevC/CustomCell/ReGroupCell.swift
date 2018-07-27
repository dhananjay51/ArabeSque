//
//  ReGroupCell.swift
//  ArabeSque
//
//  Created by DS on 26/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class ReGroupCell: UITableViewCell {
   var GroupRecommened_List:[GroupModel] = []

@IBOutlet var collectionView: UICollectionView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 10)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView!.collectionViewLayout = layout
    
         // collectionView.delegate = self
         // collectionView.dataSource = self
           getGroupRecomendedList()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension  ReGroupCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  GroupRecommened_List.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        ///let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Regroup", for: indexPath)
       
        let cell: Regroup?
        cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Regroup", for: indexPath) as? Regroup
        
        
        
    var borderColor: CGColor! = UIColor.clear.cgColor
        var borderWidth: CGFloat = 0
        
        
        borderColor = UIColor.lightGray.cgColor
        borderWidth = 0.5 //or whatever you please
        
        
        cell?.layer.borderWidth = borderWidth
        cell?.layer.borderColor = borderColor
        cell?.cell(Api: GroupRecommened_List[indexPath.row] )
        return cell!
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellsAcross: CGFloat = 3
        let spaceBetweenCells: CGFloat = 1
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        
        return CGSize(width: dim, height: dim)
    }
    
    private func getGroupRecomendedList()  {
        
        let url = APPURL.GetGroupRecommended
        
        
        let newTodo: [String: String] = [:]
        ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
            ///displayAlertView.removeFullViewActivityIndicator(self.view)
            
            DispatchQueue.main.async{
                
                
                let data =  responseData
                
                
                if let json:JSON =  JSON(responseData)
                    
                {
                    
                    
                    let ApiList = json.dictionary
                    
                    if let DataArr = json["data"].array{
                        
                        
                        if DataArr.count == 0 {
                            
                            
                        }
                        
                        
                        for ApiJSON in DataArr {
                            
                            let api = GroupModel.init()
                            
                            api.setJson(json: ApiJSON)
                             self.GroupRecommened_List.append(api)
                            
                            
                        }
                        
                        
                    }
                    
                    self.collectionView.delegate = self
                    self.collectionView.dataSource = self
                    // collectionView.dataSource = self
                    //self.groupTable.dataSource = self
                    ///self.groupTable.delegate = self
                    
                    
                }
                
                
            }
            
            
            
        }
        
        
    }
    
}
