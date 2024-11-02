//
//  DefaultAfterSearchCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/30/24.
//

import UIKit

final class DefaultAfterSearchCoordinator: AfterSearchCoordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(
        parent: Coordinator? = nil,
        navigationController: UINavigationController
    ) {
        self.parent = parent
        self.navigationController = navigationController
    }
    
    deinit {
        Log.debug("AfterSearchCoordinator Deinit")
    }
    
    func start() {
        let vc = AfterSearchViewController(afterVM: AfterSearchViewModel(afterCoordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }
    
    func finish() {
        parent?.childDidFinish(self)
    }
}
