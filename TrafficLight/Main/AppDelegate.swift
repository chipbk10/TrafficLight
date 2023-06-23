//
//  AppDelegate.swift
//  TrafficLight
//
//  Created by Hieu Luong on 21/06/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let coordinator = AppCoordinator()
        self.coordinator = coordinator
        
        window = UIWindow()
        window?.rootViewController = coordinator.start()
        window?.makeKeyAndVisible()        
        return true
    }
}

