//
//  DefaultLoginCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import UIKit

final class DefaultLoginCoordinator: LoginCoordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        Log.debug("DefaultLoginCoordinator Deinit")
    }
    
    func start() {
        let vc = LoginViewController(
            viewModel: LoginViewModel(
                loginUseCase: DefaultLoginUseCase(),
                loginCoordinator: self
            )
        )
        navigationController.pushViewController(vc, animated: true)
    }
    
    func finish() {
        parent?.childDidFinish(self)
    }
    
    func moveToTab() {
        finish()
        parent?.start()
    }
}
