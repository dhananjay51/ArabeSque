//
//  ViewUtils.swift
//  Maisonette
//
//  Created by Kumar San on 23/03/18.
//  Copyright © 2018 Rohit. All rights reserved.
//

import UIKit

class ViewUtils: NSObject
{
   static func getTableFooterLoaderView() -> UIView
    {
        let view = UIView.init(frame: CGRect(x:0,y:0,width:ScreenSize.SCREEN_WIDTH-56,height:64))
        let activity_indicator = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
        activity_indicator.center = view.center
        if App.isRunningOnIpad {
            activity_indicator.activityIndicatorViewStyle = .whiteLarge
        }
        activity_indicator.color = UIColor.Blue.buttonBackground
        activity_indicator.startAnimating()
       
        view.addSubview(activity_indicator)
        return view
    }
    static func showMessageView(message:String) {
        var messageViewHeight:CGFloat = 60
        var font = UIFont.Raleway.Regular(size: 13)
        if App.isRunningOnIpad {
            messageViewHeight = 100
           font = UIFont.Raleway.Regular(size: 17)
        }
        let window = MSSingleton.shared.appDelegate?.window
        window?.viewWithTag(1000)?.removeFromSuperview()

        let v = UIView(frame: CGRect(x: (window?.frame.origin.x)!, y: (window?.frame.height)!-messageViewHeight, width: ScreenSize.SCREEN_WIDTH, height: messageViewHeight))
        
        window?.addSubview(v);
        v.tag = 1000
        v.backgroundColor = UIColor.clear
        let v2 = UILabel(frame: CGRect(x: 40, y: 10, width: v.frame.size.width-80, height: 40))
        v2.textColor = UIColor.white
        v2.font = font
        v2.text = message
        v2.textAlignment = .center
        v2.backgroundColor = UIColor.color(red: 0, green: 0, blue: 0, alpha: 0.7)
        v2.numberOfLines = 0
        v2.lineBreakMode = .byWordWrapping
        
        v2.layer.cornerRadius = 20
        v2.layer.masksToBounds = true
        v.addSubview(v2)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            window?.viewWithTag(1000)?.removeFromSuperview()
        })
        
    }
}
