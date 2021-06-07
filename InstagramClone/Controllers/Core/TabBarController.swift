//
//  TabBarController.swift
//  InstagramClone
//
//  Created by Morgan Duverney on 6/4/21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = UserDefaults.standard.string(forKey: "username"),
              let email = UserDefaults.standard.string(forKey: "email") else { return }
        let currentUser = User(username: username, email: email)
        
        let home = HomeViewController()
        let explore = ExploreViewController()
        let camera = CameraViewController()
        let notifications = NotificationsViewController()
        let profile = ProfileViewController(user: currentUser)
        
        let navHome = UINavigationController(rootViewController: home)
        let navExplore = UINavigationController(rootViewController: explore)
        let navCamera = UINavigationController(rootViewController: camera)
        let navNotifications = UINavigationController(rootViewController: notifications)
        let navProfile = UINavigationController(rootViewController: profile)
        
        for controller in [navHome, navExplore, navCamera, navNotifications, navProfile] { controller.navigationBar.tintColor = .label}
        
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navExplore.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "safari"), tag: 1)
        navCamera.tabBarItem = UITabBarItem(title: "Camera", image: UIImage(systemName: "camera"), tag: 1)
        navNotifications.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell"), tag: 1)
        navProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)

        self.setViewControllers([navHome, navExplore, navCamera, navNotifications, navProfile], animated: true)

    }
}
