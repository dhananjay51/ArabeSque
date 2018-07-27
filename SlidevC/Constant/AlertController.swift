//
//  AlertController.swift
//  IRCTC-Air
//
//  Created by IRCTC-ITC on 25/07/17.
//  Copyright © 2017 techrohita. All rights reserved.
//

import UIKit


class AlertController {

    static func showAlert(title: String, message: String) {
        let topWindow = UIWindow(frame: UIScreen.main.bounds)
        topWindow.rootViewController = UIViewController()
        topWindow.windowLevel = UIWindowLevelAlert + 1
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "confirm"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            // continue your work
            // important to hide the window after work completed.
            // this also keeps a reference to the window until the action is invoked.
            topWindow.isHidden = true
        }))
        topWindow.makeKeyAndVisible()
        topWindow.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    
    //typealias handler = (UIAlertAction) -> Void
//    private let title: String?
//    private let message: String
//    private let actionTitles: [String]
//    private let controller: UIViewController
//    private var alert: UIAlertController?
//    private var actions: [UIAlertAction]?
//    private var actionHandlers: [handler] = [];
// 
//    init(title: String?, message: String, actions: [String], controller: UIViewController) {
//        self.title = title;
//        self.message = message;
//        self.actionTitles = actions;
//        self.controller = controller;
//    }
//    
//    func display() {
//        
//        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        
//        for actionTitle in actionTitles {
//            
//            let handler = ((UIAlertAction) -> Void).self
//            
//            actions?.append(UIAlertAction(title: actionTitle, style: .default, handler: handler)
//        }
//        
//    }
    

    
}
