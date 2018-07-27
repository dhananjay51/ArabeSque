//
//  RecoomendedItemCell.swift
//  ArabeSque
//
//  Created by DS on 26/06/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
protocol RecommendedDelegate: class {
    func getDetial(Api: ExchangeModel)
}
class RecoomendedItemCell: UITableViewCell {
    
  @IBOutlet var ItemCollection: UICollectionView!
  weak var delegate: RecommendedDelegate?
     var Recommended_List:[ExchangeModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        
       let  layout = ItemCollection.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.scrollDirection = .horizontal
        
        
        layout.sectionInset = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
         ItemCollection!.collectionViewLayout = layout
        
        getItemRecomendedList()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension  RecoomendedItemCell : UICollectionViewDelegate, UICollectionViewDataSource {
        
        
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.Recommended_List.count
            
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
         
         
            let cell: ReItemsCell?
            cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ReItemsCell", for: indexPath) as? ReItemsCell
            
            var borderColor: CGColor! = UIColor.clear.cgColor
            var borderWidth: CGFloat = 0
            
            
            borderColor = UIColor.lightGray.cgColor
            borderWidth = 0.5 //or whatever you please
            
            
            cell?.layer.borderWidth = borderWidth
            cell?.layer.borderColor = borderColor
            cell?.configureCell(Api: Recommended_List[indexPath.row])
          
            return cell!
            
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
            delegate?.getDetial(Api:Recommended_List[indexPath.row])
          
            
            
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellsAcross: CGFloat = 3
        let spaceBetweenCells: CGFloat = 1
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        
        return CGSize(width: dim, height: dim)
    }
    
    private func getItemRecomendedList()  {
        
        let url = APPURL.GetItemRecommended + "T=0&pi=0&ty=&my=false"
        
        
        let newTodo: [String: String] = [:]
        ServerHit.sharedInstance.GetApi(Dict: newTodo, Url: url) { (responseData, error)  in
           
            
            DispatchQueue.main.async{
                
                
                let data =  responseData
                
                
                if let json:JSON =  JSON(responseData)
                    
                {
                    
                    
                    let ApiList = json.dictionary
                    
                    if let DataArr = json["data"].array{
                        
                        
                        if DataArr.count == 0 {
                            
                            
                        }
                        
                        
                        for ApiJSON in DataArr {
                            
                            let api = ExchangeModel.init()
                            
                            api.setJson(json: ApiJSON)
                            self.Recommended_List.append(api)
                            
                            
                        }
                        
                        
                    }
                    
                    self.ItemCollection.delegate = self
                    self.ItemCollection.dataSource = self
                    
                    NotificationCenter.default.post(name: Notification.Name("Indicator"), object: nil, userInfo: nil)
                  
                    
                    
                }
                
                
            }
            
            
            
        }
        
        
    }
   
}
