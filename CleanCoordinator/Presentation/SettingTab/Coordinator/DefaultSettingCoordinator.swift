//
//  DefaultSettingCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import UIKit

final class DefaultSettingCoordinator: SettingCoordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SettingViewController(viewModel: SettingViewModel(coordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }
}

extension DefaultSettingCoordinator {
    func moveToLogin() {
        finish()
        parent?.parent?.start()
    }
}
