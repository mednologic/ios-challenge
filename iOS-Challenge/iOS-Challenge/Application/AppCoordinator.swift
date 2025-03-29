//
//  AppCoordinator.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import Foundation
import UIKit

public protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var tbBarController: UITabBarController { get set }
    func start()
}

class AppCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var window: UIWindow
    let repository = PropietiesDataRepository()

    lazy var tbBarController: UITabBarController = {
        getNavigation()
    }()

    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = tbBarController
        self.window.makeKeyAndVisible()
    }

    private func getNavigation() -> UITabBarController {
        let navigator = UITabBarController()
        return navigator
    }

    func start() {
        setTabBar()
    }

    func setTabBar() {
        let homeView = setHomeView()
        homeView.title = "home_title".localized
        homeView.tabBarItem.image = UIImage(systemName: "house.fill")

        let favoritesView = setFavoritesView()
        favoritesView.title = "favorites_title".localized
        favoritesView.tabBarItem.image = UIImage(systemName: "heart.fill")

        tbBarController.setViewControllers([homeView, favoritesView], animated: true)
    }

    func setHomeView() -> UINavigationController {
        let navigationController = UINavigationController()
        let view = HomeViewController()

        navigationController.setViewControllers([view], animated: true)

        return navigationController
    }

    func setFavoritesView() -> UINavigationController {
        let navigationController = UINavigationController()
        let view = FavoritesViewController()

        navigationController.setViewControllers([view], animated: true)

        return navigationController
    }
}
