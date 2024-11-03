//
//  TabBarCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        let tabBarController = TabBarViewController()
        navigationController.setViewControllers([tabBarController], animated: true)
        
        let viewControllers = TabKind.allCases.map { tabKind in
            makeNavigationController(for: tabKind)
        }
        
        tabBarController.viewControllers = viewControllers
    }
    
    private func makeNavigationController(for tabKind: TabKind) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = tabKind.tabItem
        navigationController.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        
        setupChildCoordinator(for: tabKind, navigationController: navigationController)
        
        return navigationController
    }
    
    private func setupChildCoordinator(for tabKind: TabKind, navigationController: UINavigationController) {
        let coordinator: Coordinator
        
        switch tabKind {
        case .workspace:
            coordinator = DefaultHomeCoordinator(navigationController: navigationController)
        case .dm:
            coordinator = DefaultDmCoordinator(navigationController: navigationController)
        case .search:
            coordinator = DefaultSearchCoordinator(navigationController: navigationController)
        case .setting:
            coordinator = DefaultSettingCoordinator(navigationController: navigationController)
        }
        
        coordinator.parent = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
