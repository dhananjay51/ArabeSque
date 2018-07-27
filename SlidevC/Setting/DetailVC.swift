//
//  DetailVC.swift
//  ArabeSque
//
//  Created by DS on 20/07/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage
class DetailVC: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet var Img:UIImageView!
     @IBOutlet var  imageColletionView:UICollectionView!
     var Exchangedata:ExchangeModel?
    var CellWithReuseIdentifier:String?
    var CellWithReuseIdentifier1:String?
    
    let imageNames = ["1.jpg","2.jpeg","3.jpeg","4.jpeg","5.jpeg"]
    var currentImage = 0
    @IBOutlet weak var Interest:UILabel!
    @IBOutlet weak var Like :UILabel!
    @IBOutlet weak var Interrestpeople:UIButton!
    @IBOutlet weak var Owen:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Product Details"
        let json:JSON
        json = (Exchangedata?.Imagaarr[0])!
        let photo = Exchangedata?.personImg
        let imagename  = json.dictionary!["imageURL"]?.string
        let url = URL(string: photo!)!
         let url1 = URL(string: imagename!)!
       
        let viewFN = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
       
        let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 42, height: 42))
        button1.layer.cornerRadius = button1.frame.size.width / 2
        button1.clipsToBounds = true
       
        viewFN.addSubview(button1)
         button1.af_setImage(for: .normal, url: url)
        let rightBarButton = UIBarButtonItem(customView: viewFN)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        Img.af_setImage(withURL: url1, placeholderImage:nil)
        
        print(Exchangedata ?? "")
    
        print(Exchangedata?.Imagaarr)
          configure()
         
          self.imageColletionView.register (UINib(nibName: "DetailCell", bundle: nil), forCellWithReuseIdentifier: "DetailCell")
         self.imageColletionView.register (UINib(nibName: "OwerCell", bundle: nil), forCellWithReuseIdentifier: "OwerCell")
          CellWithReuseIdentifier = "OwerCell"
        CellWithReuseIdentifier1 = "DetailCell"
        
        
        /*
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
      
        */
        let customButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backButtonTapped)) //
        self.navigationItem.leftBarButtonItem  = customButton
 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func ButtonTapped() {
        print("Button Tapped")
    }
    @objc func backButtonTapped() {
        
         self.navigationController?.popViewController(animated: true)
       /// let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //appDelegate.setside()
        
    }
   @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                if currentImage == imageNames.count - 1 {
                    //currentImage = 0
                    
                }else{
                    currentImage += 1
                }
                Img.image = UIImage(named: imageNames[currentImage])
                
            case UISwipeGestureRecognizerDirection.right:
                if currentImage == 0 {
                   // currentImage = imageNames.count - 1
                }else{
                    currentImage -= 1
                }
              Img.image = UIImage(named: imageNames[currentImage])
            default:
                break
            }
        }
    }

    /// Collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   (Exchangedata?.Imagaarr.count)!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
       
            
            return 1
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
          
       let cell  = self.imageColletionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as!  DetailCell
        
        
        let json:JSON
        json = (Exchangedata?.Imagaarr[indexPath.row])!
        
        //// for json:JSON in [Api.Imagaarr  {
        // print(json)
        //let dict = json.dictionary
        let imagename  = json.dictionary!["imageURL"]?.string
         ///let img = imageNames[indexPath.row]
          //Img.image = UIImage(named: imageNames[currentImage])
        cell.Configuration(image: imagename!)
        
        

        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 4, 10, 4)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          //let img = imageNames[indexPath.row]
        // Img.image = UIImage(named: imageNames[indexPath.row])
        let json:JSON
        json = (Exchangedata?.Imagaarr[indexPath.row])!
        
        let imagename  = json.dictionary!["imageURL"]?.string
        let url1 = URL(string: imagename!)!
        //let placeholderImage = UIImage(named: "placeholder")!
        
        Img.af_setImage(withURL: url1, placeholderImage:nil)
        
        
    }
    func configure(){
        let fullString1 = NSMutableAttributedString(string: "")
        
        let imageAttachment1 = NSTextAttachment()
        
        imageAttachment1.image = UIImage(named: "interested.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String1 = NSAttributedString(attachment: imageAttachment1)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString1.append(image1String1)
        fullString1.append(NSAttributedString(string: " 18 People Interested"))
        
        // draw the result in a label
        self.Interest.attributedText = fullString1
        
        let fullString2 = NSMutableAttributedString(string: "")
        
        // create our NSTextAttachment
        
        let imageAttachment2 = NSTextAttachment()
        
        imageAttachment2.image = UIImage(named: "view.png")
        
        // wrap the attachment in its own attributed string so we can append it
        let image1String2 = NSAttributedString(attachment: imageAttachment2)
        
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString2.append(image1String2)
        fullString2.append(NSAttributedString(string: " 24 People Viewed "))
        self.Like.attributedText = fullString2
        let attrString = NSAttributedString(string: "Product Owner", attributes: [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue,NSAttributedStringKey.underlineColor: UIColor.red])
      
        
        
        self.Owen.setAttributedTitle(attrString, for: .normal)
        let attrString1 = NSAttributedString(string: "Interested People", attributes: [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue,NSAttributedStringKey.underlineColor: UIColor.white])
        
        
        self.Interrestpeople.setAttributedTitle(attrString1, for: .normal)
        
        
    }
    

}
