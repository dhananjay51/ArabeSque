//
//  AlertConstants.swift
//  IRCTC-Air
//
//  Created by IRCTC-ITC on 11/07/17.
//  Copyright © 2017 techrohita. All rights reserved.
//

import Foundation
import UIKit

//UIDevice.current.userInterfaceIdiom == .phone
// or


//Mark:- App Constants
struct App {
    static let isRunningOnIpad = UIDevice.current.userInterfaceIdiom == .pad ? true : false
    static let name = "ArabeSque"
    static let activitiIndicatorTitle = "Loading..."
}

//Mark:- Placeholder Image Constants
struct PlaceholderImage {
    static let property = "Placeholder"
    static let defaultImg = "Placeholder"
}

struct backImageType
{
    static let backImage = "Header Back Btn"
    static let menuImage = "menu"
}


//Mark:- Response
enum Response {
    case success(String)
    case error(String)
}

struct UserProfileKeys {
    static let id = "ID"
    static let name = "Name"
    static let email = "Email"
    static let password = "Password"
    static let sessionId = "SessionID"
    static let pictureURL = "PictureUrl"
    static let address = "Address"
    static let mobile = "Mobile"
    static let IsExternalUser = "IsExternalUser"
    
    
    //PropertyManager Keys
    static let SDS_ID = "SDS_ID"
    static let IsPrimaryPM = "IsPrimaryPM"
    static let IsAdmin = "IsAdmin"
    static let UserType = "UserType"
    static let IsEmailSmsConfiguration = "IsEmailSmsConfiguration"
    static let IsGeneralSetting = "IsGeneralSetting"
    static let IsCreateUser = "IsCreateUser"
    static let IsBlockUnblockUser = "IsBlockUnblockUser"
    
    //Broker Keys
    
    static let Broker_ID = "BrokerID"
    static let SelectedCountry = "SelectedCountry"
    static let li_accessTokenKey = "LI_AccessToken"
    
 
}

struct WebServicesKeys {
    static let password = "userpassword"
    static let sessionId = "ASP.NET_SessionId"
    static let oldPassword = "oldpassword"
    static let newPassword = "newpassword"
}

extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8),
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}











