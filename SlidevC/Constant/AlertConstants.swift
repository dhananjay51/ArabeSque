//
//  AlertConstants.swift
//  Maisonette
//
//  Created by IRCTC-ITC on 25/10/17.
//  Copyright © 2017 Rohit. All rights reserved.
//

import Foundation

//MARK:- Alert Titles
struct IndicatorTitle {
    static let splash = "Checking Updates..."
    static let searchFlight = "Searching Flights..."
}


struct Alert {
    
    //MARK:- Alert Titles
    struct Title {
        static let splash = App.name//"InitialData"
        static let login = App.name//"Login"
        static let signUp = App.name//"SignUp"
        static let forgotPass = App.name//"Forgot Password"
        static let searchProperty = App.name//"Search Properties"
        static let searchResult = App.name//"Search Result"
        static let propertyDetails = App.name//"Property Details"
        static let enquire = App.name//"Enquire"
        static let myProfile = App.name//"My Profile"
        static let myActivity = App.name//"My Activity"
        static let helpAndSupport = App.name//"Help and Support"
    }
    
    
    //MARK:- Action Titles
    struct ActionTitle {
        static let ok = "Ok"
        static let cancel = "Cancel"
        static let no = "No"
        static let retry = "Retry"
        static let download = "Download"
    }
    
    //MARK:- Splash Messages
    struct Message {
        //MARK:- Common
//        private static let redirecting = "We are redirecting you to login screen"
//        private static let needToLogin = "You need to login"
        static let needToLogin = "You need to login. We are redirecting you to login screen"
        static let needLoginFromMenu = "You need login."
        static let noSearchPropertyResult = "No properties found matching your search criteria. Please search again."
        
        //MARK:- Server Messages
        static let success = "Success"

        
        //MARK:- Server Messages
        static let internetError = "Please check your internet connection and try again"
        static let serverBusy = "Server busy. Try again later."
        static let unknownError = "Unable to perform operation.\nTry again later."
        static let dataNotFound = "Data not found";
        static let sessionExpired = "Yor session expired, plese login again"

        //MARK:- SignIN & SignUP Messages
        static let usernameNotValid = "Please enter  username"
        static let mobileNotValid = "Please enter valid phone number";
        static let enterUserName = "Please enter username";
        static let enterValidPass = "Please enter valid password";
        static let loginFaild = "Login failed"
        static let confirmPassNotMatching = "Password & Confirm Password are not matching, Please re-enter";
        static let nameNotValid = "Please enter name"
        static let emailNotValid = "Please enter valid email"
        static let signOut = "Are you sure you want to logout"

        //MARK:- Forgot Password Messages
        static let forgotMailSent = "Password has been sent to the email address you have provided"
        
        //MARK:- Change Password Messages
        static let enterCorrectPass = "Please enter valid old password";

        //MARK:- Enquire Messages
        static let validEnquire = "Please enter enquire text";
        
        
        //MARK:- Search property
        static let selectLocation = "Please select location"
        static let selectPropertyType = "Please select property type"
        
        //MARK:- Set Alert
        static let selectAlertFrequency = "Please select alert frequency"
        static let enterAlertTitle = "Please specify Alert title"

        
        //Help and support
        static let  issueType = "Please select issue Category"
        static let issueTitle = "Please enter issue Title."
        static let issueDescription = "Please enter issue Description"
        
        //MARK: Menu
        static let notLoggedIn = "You are not logged in the app!"

        //MARK: Filter
        static let selectFilter = "Please Select atleast one filter"
        static let unabletoLogin = "Unable to login. Please try again."
    }

}
