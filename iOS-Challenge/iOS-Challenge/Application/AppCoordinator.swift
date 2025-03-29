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
        Task {
            do {
                let list = try await repository.fetchPropietiesList()
                print(list)
            } catch {
                print("Error fetching properties: \(error)")
            }
        }

        // TODO: hacer tabbar
    }
}
