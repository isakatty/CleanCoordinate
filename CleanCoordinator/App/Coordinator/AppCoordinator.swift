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
        
        start()
    }
    
    deinit {
        print("AppCoordinator는 deinit됐나요 ?")
    }
    
    func start() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        searchCoordinator.start()
    }
    
    func finish() {
        
    }
}
