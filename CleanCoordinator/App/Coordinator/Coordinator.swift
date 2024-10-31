//
//  Coordinator.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/30/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var parent: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
    func finish()
}

extension Coordinator {
    func childDidFinish(_ coordinator : Coordinator){
        for (index, child) in childCoordinators.enumerated() {
            print(index, "이거 왜 안돌아요")
            if child === coordinator {
                childCoordinators.remove(at: index)
                print(childCoordinators)
                break
            }
        }
    }
}
