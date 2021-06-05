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
        
        let home = HomeViewController()
        let explore = ExploreViewController()
        let camera = CameraViewController()
        let notifications = NotificationsViewController()
        let profile = ProfileViewController()
        
        let navHome = UINavigationController(rootViewController: home)
        let navExplore = UINavigationController(rootViewController: explore)
        let navCamera = UINavigationController(rootViewController: camera)
        let navNotifications = UINavigationController(rootViewController: notifications)
        let navProfile = UINavigationController(rootViewController: profile)
        
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navExplore.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "safari"), tag: 1)
        navCamera.tabBarItem = UITabBarItem(title: "Camera", image: UIImage(systemName: "camera"), tag: 1)
        navNotifications.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell"), tag: 1)
        navProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)

        self.setViewControllers([navHome, navExplore, navCamera, navNotifications, navProfile], animated: true)

    }
}
