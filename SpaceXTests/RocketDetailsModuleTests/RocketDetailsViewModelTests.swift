//
//  RocketDetailsViewModelTests.swift
//  SpaceXTests
//
//  Created by Jaafar Barek on 28/03/2021.
//

import XCTest
@testable import SpaceX

class RocketDetailsViewModelTests: XCTestCase {

    var viewModel: RocketDetailsViewModel!

    var dependencyProvider: DependencyProviderMock!

    override func setUp() {
        super.setUp()

        dependencyProvider = DependencyProviderMock()
        
        let data = loadStubFromBundle(withName: "Launch", extension: "json")
        let launchList = try! JSONDecoder().decode([Launch].self, from: data)

        viewModel = RocketDetailsViewModel(dependencies: dependencyProvider, launch: launchList[0])
        
        let rocketData = loadStubFromBundle(withName: "Rocket", extension: "json")
        let rocket = try! JSONDecoder().decode(Rocket.self, from: rocketData)
        
        viewModel.rocket = rocket
    }

    override func tearDown() {
        viewModel = nil
        dependencyProvider = nil

        super.tearDown()
    }

    // MARK: Test Internal API

    func testRocketDetailsViewModel_nameValue() {
 
        XCTAssertEqual(viewModel.name, "Falcon 9")
    }
    
    func testRocketDetailsViewModel_tripNameValue() {
 
        XCTAssertEqual(viewModel.tripName, "FalconSat")
    }

    func testRocketDetailsViewModel_descriptionValue() {
 
        XCTAssertEqual(viewModel.description, "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft into orbit.")
    }
    
    func testRocketDetailsViewModel_imageUrlValue() {
 
        XCTAssertEqual(viewModel.imageUrl, URL(string:"https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg")!)
    }
    
    func testRocketDetailsViewModel_wikepediaUrlValue() {
 
        XCTAssertEqual(viewModel.wikepediaUrl, URL(string:"https://en.wikipedia.org/wiki/Falcon_9")!)
    }
}
