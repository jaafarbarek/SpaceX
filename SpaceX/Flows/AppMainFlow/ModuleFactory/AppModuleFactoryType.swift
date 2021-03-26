//
//  AppModuleFactoryType.swift
//  Neo
//
//  Created by Matic on 4/16/20.
//  Copyright © 2020 Neo. All rights reserved.
//

import Foundation

protocol AppModuleFactoryType: class {
    func makeLaunchListModule(dependencies: LaunchListViewModel.Dependencies) -> LaunchListViewController
    func makeRocketDetailstModule(dependencies: RocketDetailsViewModel.Dependencies, launch: Launch) -> RocketDetailsViewController
}
