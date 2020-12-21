//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by gjh on 14/12/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = FBMeViewController()
        let nav = UINavigationController(rootViewController: viewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }

}

