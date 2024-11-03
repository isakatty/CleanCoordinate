//
//  DefaultHomeCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import UIKit

final class DefaultHomeCoordinator: HomeCoordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeViewController(viewModel: HomeViewModel(coordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }
}
