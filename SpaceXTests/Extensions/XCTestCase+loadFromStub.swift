//
//  XCTestCase+loadFromStub.swift
//  SpaceXTests
//
//  Created by Jaafar Barek on 28/03/2021.
//

import XCTest

extension XCTest {
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)

        return try! Data(contentsOf: url!)
    }
}
