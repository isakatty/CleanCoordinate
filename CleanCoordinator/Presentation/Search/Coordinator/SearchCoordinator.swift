//
//  SearchCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/30/24.
//

import UIKit

final class SearchCoordinator: Coordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("== SearchCoordinator Deinit ==")
    }
    
    func start() {
        let vc = SearchViewController(
            searchVM: SearchViewModel(
                searchUseCase: DIContainer.shared.searchUseCase,
                coordinator: self
            )
        )
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toAfterSearch() {
        let afterCoordinator = AfterSearchCoordinator(
            parent: self,
            navigationController: navigationController
        )
        childCoordinators.append(afterCoordinator)
        print("Child coordinators: \(childCoordinators)")
        afterCoordinator.start()
    }
    
    func finish() {
        parent?.childDidFinish(self)
    }
}