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
    
    deinit {
        Log.info("DefaultSettingCoordinator - deinit !!!!")
    }
    
    func start() {
        let vc = SettingViewController(viewModel: SettingViewModel(coordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }
}

extension DefaultSettingCoordinator {
    func moveToLogin() {
        parent?.logout()
        navigationController.viewControllers.removeAll()
        parent?.parent?.start()
    }
}
