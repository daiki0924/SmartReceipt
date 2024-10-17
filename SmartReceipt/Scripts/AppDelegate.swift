//
//  AppDelegate.swift
//  SmartReceipt
//
//  Created by Daiki Kobayashi on 2024/10/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = TabBarController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}

