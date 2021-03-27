//
//  LaunchViewModelTests.swift
//  SpaceXTests
//
//  Created by Jaafar Barek on 28/03/2021.
//

import XCTest
@testable import SpaceX

class LaunchViewModelTests: XCTestCase {

    var viewModel: LaunchCellViewModel!

    var launch: Launch!
    var launchList = [Launch]()

    override func setUp() {
        super.setUp()

        let data = loadStubFromBundle(withName: "Launch", extension: "json")
        let launchList = try! JSONDecoder().decode([Launch].self, from: data)
        launch = launchList[0] // Here we are sure it has values since it is mock file we created
        self.launchList = launchList

        viewModel = LaunchCellViewModel(launch: launch)
    }

    override func tearDown() {
        viewModel = nil
        launch = nil

        super.tearDown()
    }

    func testLaunchCellViewModel_displayNameValue() {
        XCTAssertEqual(viewModel.displayName, "FalconSat")
    }

    func testLaunchCellViewModel_detailsTextValue() {
        XCTAssertEqual(viewModel.detailsText, "Engine failure at 33 seconds and loss of vehicle")
    }
    
    func testLaunchCellViewModel_flightNumberValue() {
        XCTAssertEqual(viewModel.flightNumber, 1)
    }

    func testLaunchCellViewModel_dateTextValue() {
        XCTAssertEqual(viewModel.dateText, "25 March 2006 - 12:30")
    }
    
    func testLaunchCellViewModel_isUpcoming_isFalse() {
        XCTAssertFalse(viewModel.isUpcoming)
    }
    
    func testLaunchCellViewModel_isUpcoming_isTrue() {
        // Given
        launch = launchList[3]
        
        // When
        viewModel = LaunchCellViewModel(launch: launch)

        // Then
        XCTAssertTrue(viewModel.isUpcoming)
    }
}
