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
        print("AppCoordinator는 deinit됐나요 ?")
    }
    
    func start() {
        let searchCoordinator = DefaultSearchCoordinator(navigationController: navigationController)
        searchCoordinator.parent = self
        childCoordinators.append(searchCoordinator)
        print("AppCoordinator Child coordinators: \(childCoordinators)")
        searchCoordinator.start()
    }
    
    func finish() {
        childCoordinators.removeLast()
    }
}
