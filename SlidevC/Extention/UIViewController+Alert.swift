//
//  UIViewController+Alert.swift
//  Maisonette
//
//  Created by IRCTC-ITC on 06/12/17.
//  Copyright © 2017 Rohit. All rights reserved.
//

import UIKit
typealias CompletionIndex = (Int) -> Void
typealias AlertTitleAndStyle = (title: String, style: UIAlertActionStyle?)
extension UIViewController {
    func presentAlert(title: String, message: String, actionTitlesAndStyles: [(title: String, style: UIAlertActionStyle?)], completionIndex: @escaping CompletionIndex) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, titleAndStyle) in actionTitlesAndStyles.enumerated() {
            alert.addAction(UIAlertAction(title: titleAndStyle.title, style: titleAndStyle.style ?? .default, handler: { (action) in
                completionIndex(index)
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentAlert(title: String, message: String, actionTitle: String, actionStyle: UIAlertActionStyle?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: actionStyle ?? .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


//func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
//    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//    for (index, option) in options.enumerated() {
//        alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
//            completion(index)
//        }))
//    }
//    self.present(alertController, animated: true, completion: nil)
//}

