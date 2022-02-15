//
//  AppDelegate.swift
//  Destiny_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var destinyCoordinator: DestinyCoordinator?
    let navController = UINavigationController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeWindow()
        return true
    }
    
    func initializeWindow() {
        destinyCoordinator = DestinyCoordinator(navigationController: navController)
        destinyCoordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

