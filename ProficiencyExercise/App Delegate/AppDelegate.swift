//
//  AppDelegate.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 20/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationVC = UINavigationController()
        self.window?.rootViewController = navigationVC
        navigationVC.pushViewController(ViewController(), animated: false)
        self.window?.makeKeyAndVisible()

        return true
    }
}
