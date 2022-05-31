//
//  FirstViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 04.04.2022.
//

import UIKit

//Показывает ленту пользователя
class MainTabBarController: UITabBarController {
    //    Лента пользователя
    let userFeed = FeedViewController()
    //    Профиль пользователя
    let profile = ProfileViewController()
    //    Экран авторизации
    let logInView = LogInViewController()
    
    let statusBarView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray6
        return $0
    }(UIView())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationControllers()
        layout()
    }
    
    private func setupNavigationControllers() {
        
        let FeedViewController = UINavigationController(rootViewController: userFeed)
        
        userFeed.tabBarItem.title = "Лента пользователя"
        userFeed.tabBarItem.image = UIImage (systemName: "scroll")
        
        let LogInViewController = UINavigationController(rootViewController: logInView)
        logInView.tabBarItem.title = "Профиль"
        logInView.tabBarItem.image = UIImage (systemName: "person")
        
        UITabBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().backgroundColor = .white
        
        
//        let ProfileViewController = UINavigationController(rootViewController: profile)
//        profile.tabBarItem.title = "Профиль"
//        profile.tabBarItem.image = UIImage (systemName: "person")
        
        
        viewControllers = [FeedViewController, LogInViewController]
    }
    
    func layout() {
        view.addSubview(statusBarView)
        
        NSLayoutConstraint.activate([
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
}
