//
//  DefaultDmCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import UIKit

final class DefaultDmCoordinator: DmCoordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
//        Log.debug("DmCoordinator Deinit")
    }
    
    func start() {
        let vc = DmViewController(viewModel: DmViewModel(coordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }
}
