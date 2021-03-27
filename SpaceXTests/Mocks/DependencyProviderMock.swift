//
//  DependencyProviderMock.swift
//  SpaceXTests
//
//  Created by Jaafar Barek on 28/03/2021.
//

import Foundation
@testable import SpaceX

class DependencyProviderMock: HasNetworkService {

    let networkService: NetworkService

    init() {
        self.networkService = SpacexService()
    }
}
