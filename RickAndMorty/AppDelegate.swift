//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: MainVC.loadFromNib())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }
}

