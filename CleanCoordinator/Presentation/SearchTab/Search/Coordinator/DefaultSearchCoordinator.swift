//
//  DefaultSearchCoordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/30/24.
//

import UIKit

final class DefaultSearchCoordinator: SearchCoordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    deinit {
        Log.debug("SearchCoordinator Deinit")
    }
    
    func start() {
        let vc = SearchViewController(searchVM: SearchViewModel(searchUseCase: DefaultSearchUseCase(), coordinator: self))
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toAfterSearch() {
        let afterCoordinator = DefaultAfterSearchCoordinator(
            parent: self,
            navigationController: navigationController
        )
        childCoordinators.append(afterCoordinator)
        Log.debug("SearchCoordinator - chils : \(childCoordinators)")
        afterCoordinator.start()
    }
    
    func finish() {
        parent?.childDidFinish(self)
    }
}
