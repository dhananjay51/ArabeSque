//
//  URLConstants.swift
//  IRCTC-Air
//
//  Created by IRCTC-ITC on 23/05/17.
//  Copyright © 2017 techrohita. All rights reserved.
//

import UIKit

struct APPURL
{
    private struct Domains {
        static let dev = "http://api.goarabesque.com"
        static let uat = "http://api.goarabesque.com"
        
    }
    private struct Routes {
        static let api = "/api/"
       
       
    }
    private static let domain = Domains.uat
    
    private static let apiRoute = Routes.api
    
    private static let baseURL = domain + apiRoute
   
   /*********************---Web Services---*********************/

    static var signUp: String {
        return baseURL + "User/Register"
    }
    
    static var signIn: String {
        return baseURL + "User/Login"
    }
    

 static var Exchange: String {
    return baseURL + "Exchange/SearchItems?"
}
    static var Group: String {
        return baseURL + "Groups/SearchGroups?"
    }
    static var People: String {
        return baseURL + "People/SearchUsers?"
    }
    static var EventList: String {
        return baseURL + "Events/SearchEvents?"
    }
    static var PeoPleDetailUrl: String {
        return baseURL + "People/GetUserDetails?"
    }
    static var GetWallPostsUrl: String {
        
        return baseURL + "Timeline/GetWallPosts?"
    }
    static var GetEventCategoryUrl: String {
        
        return baseURL + "Events/GetEventCategories?"
    }
    static var GetGroupCategory: String {
        return baseURL + "Groups/GetGroupCategories?"
    }
    static var GetGroupRecommended: String {
        return baseURL + "Groups/MostRecommendedGroups?"
    }
    static var GetItemRecommended: String {
        return baseURL + "Exchange/RecommendedItems?"
    }
    

}
