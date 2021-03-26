//
//  DependencyProvider.swift
//  Neo
//
//  Created by Matic on 4/17/20.
//  Copyright © 2020 Neo. All rights reserved.
//

import Foundation

class DependencyProvider: HasNetworkService {

    let networkService: NetworkService

    init() {
        networkService = SpacexService()
    }
}
