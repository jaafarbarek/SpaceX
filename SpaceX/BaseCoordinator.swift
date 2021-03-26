//
//  BaseCoordinator.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import UIKit

class BaseCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    let router: RouterType

    init(router: RouterType) {
        self.router = router
    }

    func start() {
        // should be implemented in subclasses if needed
    }

    func toPresent() -> UIViewController {
        return router.toPresent()
    }

    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinator?) {
        guard let coordinator = coordinator, !childCoordinators.isEmpty else {
            return
        }

        // Clear child-coordinators recursively
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter { $0 !== coordinator }
                .forEach { coordinator.removeChildCoordinator($0) }
        }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
