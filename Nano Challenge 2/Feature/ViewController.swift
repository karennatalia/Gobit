//
//  ViewController.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 25/07/22.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTabBarVCs()
    }
    
    func setupUI() {
        view.backgroundColor = .bgColor
        UITabBar.appearance().barTintColor = .white
        tabBar.tintColor = UIColor.primGreen
    }
    
    func setupTabBarVCs() {
        viewControllers = [
            createNavController(for: HomeViewController(), tabTitle: "Today", pageTitle: "It's Monday!", image: UIImage(systemName: "list.bullet")!),
            createNavController(for: GoalsViewController(), tabTitle: "Goals", pageTitle: "My Goals", image: UIImage(systemName: "target")!)
        ]
    }
    
    func createNavController(for rootViewController: UIViewController, tabTitle: String, pageTitle: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = tabTitle
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = pageTitle
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primGreen]
        navController.navigationBar.compactAppearance = appearance
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        
        return navController
    }
}
