//
//  AppModuleFactoryType.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import Foundation

protocol AppModuleFactoryType: class {
    func makeLaunchListModule(dependencies: LaunchListViewModel.Dependencies) -> LaunchListViewController
    func makeRocketDetailstModule(dependencies: RocketDetailsViewModel.Dependencies, launch: Launch) -> RocketDetailsViewController
}
