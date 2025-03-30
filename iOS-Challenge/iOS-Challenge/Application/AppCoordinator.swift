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
    var tabBarController: UITabBarController { get set }
    func start()
}

class AppCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var window: UIWindow
    private let repository: PropietiesDataRepositoryProtocol

    lazy var tabBarController: UITabBarController = {
        getNavigation()
    }()

    init(window: UIWindow, repository: PropietiesDataRepositoryProtocol = PropietiesDataRepository()) {
        self.window = window
        self.repository = repository
        self.window.rootViewController = tabBarController
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
        homeView.title = "HOME_TITLE".localized
        homeView.tabBarItem.image = UIImage(systemName: "house.fill")

        let favoritesView = setFavoritesView()
        favoritesView.title = "FAVORITES_TITLE".localized
        favoritesView.tabBarItem.image = UIImage(systemName: "heart.fill")

        tabBarController.tabBar.tintColor = DesignSystem.Colors.tabBarSelectedUIColor
        tabBarController.tabBar.unselectedItemTintColor = DesignSystem.Colors.tabBarUnselectedUIColor
        tabBarController.setViewControllers([homeView, favoritesView], animated: true)
    }

    func setHomeView() -> UINavigationController {
        let navigationController = UINavigationController()
        let view = HomeViewController(repository: repository)

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
