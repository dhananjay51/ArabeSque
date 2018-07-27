//
//  ViewConstant.swift
//  Maisonette
//
//  Created by IRCTC-ITC on 01/11/17.
//  Copyright © 2017 Rohit. All rights reserved.
//

import UIKit


let screenScaleFactor : CGFloat =  DeviceType.IS_IPAD ? UIScreen.main.bounds.size.width / 768.0 : UIScreen.main.bounds.size.width / 320.0

//==========================
//MARK:Device Types & Size
struct ScreenSize{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0 || UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MIN_LENGTH == 320.0
    
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0  || UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MIN_LENGTH == 375.0
    
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0 ||  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MIN_LENGTH == 414.0
    
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPHONE            = UIDevice.current.userInterfaceIdiom == .phone
    
}

//==========================
//MARK:Check iOSVersion
struct Version{
    static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
}

//MARK:
//MARK: FontName
struct MMFontName {
    
    static let MMPoppinsBold         = "Poppins-Bold"
    static let MMPoppinsRegular      = "Poppins-Regular"
    
    static let MMPoppinsLight        = "Poppins-Light"
    static let MMPoppinsMedium       = "Poppins-Medium"
    static let MMPoppinsSemiBold     = "Poppins-SemiBold"
    
    
}

//MARK:
//MARK: StoryboardName
struct StoryBoardName {
    
    static let kMain           = "Main"
    static let kRegisteration  = "Registeration"
    static let kSetting        = "Settings"
    static let kLoginMenu      = "LoginMenu"
    static let kPlayer         = "Player"
    static let kBookmark       = "Bookmark"
    static let kCategories     = "Categories"
    static let kEditProfile    = "EditProfile"
    static let kPodcastDetail  = "PodcastDetail"
    static let kPlaylist       = "Playlist"
    static let kWidget         = "PlayerWidget"
    static let kRichMedia      = "RichMedia"
    static let kChangePassword = "ChangePassword"
    static let kBookmarkList   = "BookmarkList"
}


struct ViewConstants {
    static let cornorRedius: CGFloat = 4.0
    static let borderWidth = 1.0
    static let borderColor = UIColor.clear
}


let linkedInKey = "78gqtmgotitkvb"
//let linkedInKey = "86is4dpw2mc5m5"
let linkedInSecret = "mZMmSymAVnerNAIR"
//let linkedInSecret = "yHTGWfNl51A8raCp"
let authorizationEndPoint = "https://www.linkedin.com/uas/oauth2/authorization"

let accessTokenEndPoint = "https://www.linkedin.com/uas/oauth2/accessToken"

