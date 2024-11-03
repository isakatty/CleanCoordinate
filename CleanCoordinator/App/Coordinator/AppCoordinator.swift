//
//  AppCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/30/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        Log.debug("AppCoordinator deinit")
    }
    
    func start() {
        let isLogined = UserDefaults.standard.value(forKey: "login") as? Bool ?? false
        
        if isLogined {
            startTab()
        } else {
            startLogin()
        }
    }
    
    func finish() {
        childCoordinators.removeLast()
    }
    
    private func startTab() {
        let tabCoordinator = TabBarCoordinator(navigationController: navigationController)
        tabCoordinator.parent = self
        childCoordinators.append(tabCoordinator)
        Log.debug("AppCoordinator - chils : \(childCoordinators)")
        tabCoordinator.start()
        
    }
    
    private func startLogin() {
        let loginCoordinator = DefaultLoginCoordinator(navigationController: navigationController)
        loginCoordinator.parent = self
        childCoordinators.append(loginCoordinator)
        Log.debug("AppCoordinator - chils : \(childCoordinators)")
        loginCoordinator.start()
    }
}
