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
            startSearch()
        } else {
            startLogin()
        }
    }
    
    func finish() {
        childCoordinators.removeLast()
    }
    
    private func startSearch() {
        let searchCoordinator = DefaultSearchCoordinator(navigationController: navigationController)
        searchCoordinator.parent = self
        childCoordinators.append(searchCoordinator)
        Log.debug("AppCoordinator - chils : \(childCoordinators)")
        searchCoordinator.start()
    }
    
    private func startLogin() {
        let loginCoordinator = DefaultLoginCoordinator(navigationController: navigationController)
        loginCoordinator.parent = self
        childCoordinators.append(loginCoordinator)
        Log.debug("AppCoordinator - chils : \(childCoordinators)")
        loginCoordinator.start()
    }
}
