//
//  AppCoordinator.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    private let dependencyProvider: DependencyProvider
    private let moduleFactory: AppModuleFactoryType

    init(router: RouterType,
         moduleFactory: AppModuleFactoryType) {
        self.dependencyProvider = DependencyProvider()
        self.moduleFactory = moduleFactory
        super.init(router: router)
    }

    override init(router: RouterType) {
        self.dependencyProvider = DependencyProvider()
        self.moduleFactory = AppModuleFactory()
        super.init(router: router)
    }

    override func start() {
        showLaunchListModule()
    }
}

// MARK: - Private helper methods
private extension AppCoordinator {
    func showLaunchListModule() {
        let launchListViewController = moduleFactory.makeLaunchListModule(dependencies: dependencyProvider)
        launchListViewController.launchSelectable = self
        router.setRootModule(launchListViewController, hideBar: false)
    }

    func showRocketDetailsModule(launch: Launch) {
        let rocketDetailsViewController = moduleFactory
            .makeRocketDetailstModule(dependencies: dependencyProvider,
                                      launch: launch)

        
        self.router.push(rocketDetailsViewController, animated: true, completion: nil)
        

    }
}

extension AppCoordinator: LaunchSelectable {
    
    func didSelect(item: Launch) {
        showRocketDetailsModule(launch: item)
    }
}
