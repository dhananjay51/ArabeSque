//
//  AppDelegate.swift
//  SlidevC
//
//  Created by Macbook Pro on 30/03/1940 Saka.
//  Copyright © 1940 Saka Macbook Pro. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn
import TwitterCore
import TwitterKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate {

    var window: UIWindow?
    var centerContainer: MMDrawerController?
    var Servicebool: Bool?
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(signIn)
        print(user)
        
    }

 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
       // let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        ///if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
           /// statusBar.backgroundColor = UIColor(red: 33.0/255.0, green: 194.0/255.0, blue: 248.0/255.0, alpha: 1.0)
        //}
        /// UIApplication.shared.statusBarStyle = .lightContent
        
        
           IQKeyboardManager.shared.enable = true
    // facebook Login
        FBSDKApplicationDelegate .sharedInstance() .application(application, didFinishLaunchingWithOptions: launchOptions)
        // Override point for customization after application launch.
        
        // Initialize sign-in
        // GmailSign UP
        GIDSignIn.sharedInstance().clientID = "638126905039-a0foariqsmc94teaujtjch6npjg4e2fv.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        // Twitter
        TWTRTwitter.sharedInstance().start(withConsumerKey:"WiK3P7TDtDJl9Vr9BVBWfUqr1", consumerSecret:"CPLPnRST0vgs2A1Ox56ZwtpDXKgYVeRdi5kgwyWr4zrAoRT0TK")
        return true
    }
    
   
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    
   
        
        
        let fbshouldOpen = FBSDKApplicationDelegate.sharedInstance().application(app, open: url as URL, options: [UIApplicationOpenURLOptionsKey(rawValue: UIApplicationOpenURLOptionsKey.sourceApplication.rawValue):UIApplicationOpenURLOptionsKey.annotation])
        
        
        
        if GIDSignIn.sharedInstance().handle(url as URL?, sourceApplication: UIApplicationOpenURLOptionsKey.sourceApplication.rawValue, annotation: UIApplicationOpenURLOptionsKey.annotation) {
            return true
        
         }
        else  if  fbshouldOpen{
            
           return  true
            
        }
        else{
              return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
            
        }
        
        }
        

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
    withError error: Error!) {
    // Perform any operations when the user disconnects from app here.
    // ...
    }

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        //App activation code
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func setside()   {
        
       
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.0/255.0, green: 195.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let mainStoryboard :UIStoryboard = UIStoryboard(name:"Main", bundle :nil)
        let centerViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomevC") as! HomevC
        let leftViewController = mainStoryboard.instantiateViewController(withIdentifier: "SideMenuvC") as! SideMenuvC
        
        let leftSideNav =  UINavigationController(rootViewController: leftViewController)
        
        let centerNav =    UINavigationController(rootViewController: centerViewController)
        
        centerContainer = MMDrawerController(center: centerNav, leftDrawerViewController: leftSideNav)
        ///centerContainer!.openDrawerGestureModeMask = MMOpenDrawerGestureMode.panningCenterView
       //    centerContainer!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.panningCenterView
           window!.rootViewController = centerContainer
           window!.makeKeyAndVisible()
        
    }
    
}

