//
//  AppDelegate.swift
//  Pregmo
//
//  Created by Deyan Zhekov on 3/19/17.
//  Copyright © 2017 Deyan Zhekov. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        
        UITabBar.appearance().tintColor = UIColor.init(colorLiteralRed: 243/255.0,
                                                       green: 166/255.0,
                                                       blue: 91/255.0,
                                                       alpha: 1.0)
        
        let tabBarController = window?.rootViewController as! UITabBarController
        tabBarController.delegate = self
        
        return true
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
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: UITabBarControllerDelegate

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if (tabBarController.selectedViewController is HearBeatViewController)
            && viewController is EcographyViewController {
            
            let heartBeatViewController = tabBarController.selectedViewController as! HearBeatViewController
            
            if !heartBeatViewController.isPulsatingHeartBeat {
                return true
            }
            
            let message: String = "You are currently tracking the baby's heart beat.\n\nDo you really want to stop it now?"
            let alertController = UIAlertController(title: "Warning!",
                                                    message: message,
                                                    preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let stopAction   = UIAlertAction(title: "Stop Now",
                                             style: .destructive,
                                             handler: { (action: UIAlertAction) in
                                                
                                                heartBeatViewController.stopPulsingHeartBeat(animated: false)
                                                tabBarController.selectedIndex = 1
                                            })
            
            alertController.addAction(cancelAction)
            alertController.addAction(stopAction)
            
            heartBeatViewController.present(alertController, animated: true, completion: nil)
            
            return false
            
        }
        
        return true
    }
}

