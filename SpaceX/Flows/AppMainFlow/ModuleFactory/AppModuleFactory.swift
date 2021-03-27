//
//  AppModuleFactory.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import Foundation

final class AppModuleFactory: AppModuleFactoryType {
    
    func makeLaunchListModule(dependencies: LaunchListViewModel.Dependencies) -> LaunchListViewController {
        let launchListViewController = LaunchListViewController.instantiate()
        launchListViewController.viewModel = LaunchListViewModel(dependencies: dependencies)
        return launchListViewController
    }
    
    func makeRocketDetailstModule(dependencies: RocketDetailsViewModel.Dependencies, launch: Launch) -> RocketDetailsViewController {
        let rocketDetailsViewController = RocketDetailsViewController.instantiate()
        rocketDetailsViewController.viewModel = RocketDetailsViewModel(dependencies: dependencies, launch: launch)
        return rocketDetailsViewController
    }
}
