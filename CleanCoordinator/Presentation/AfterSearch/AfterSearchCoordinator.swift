//
//  AfterSearchCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/30/24.
//

import UIKit

final class AfterSearchCoordinator: Coordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AfterSearchViewController(afterVM: AfterSearchViewModel(afterCoordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }
}

