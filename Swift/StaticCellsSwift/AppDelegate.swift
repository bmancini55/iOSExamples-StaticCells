//
//  AppDelegate.swift
//  StaticCellsSwift
//
//  Created by Brian Mancini on 9/28/14.
//  Copyright (c) 2014 iOSExamples. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let tableViewController = TableViewController(style: UITableViewStyle.Grouped)
        let navController = UINavigationController(rootViewController: tableViewController)
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

