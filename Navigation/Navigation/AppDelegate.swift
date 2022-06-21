//
//  AppDelegate.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .secondarySystemBackground
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
        
        let tabBarController = UITabBarController()
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        let profileViewController = UINavigationController(rootViewController: LoginViewController())
        
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "mount"), tag: 0)
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
        
        tabBarController.viewControllers = [feedViewController, profileViewController]
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        
        return true
    }
}
