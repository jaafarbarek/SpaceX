//
//  BaseCoordinatorTest.swift
//  SpaceXTests
//
//  Created by Jaafar Barek on 27/03/2021.
//

import XCTest
@testable import SpaceX

class BaseCoordinatorTest: XCTestCase {

    var coordinator: BaseCoordinator!

    override func setUp() {
        super.setUp()

        coordinator = BaseCoordinator(router: Router())
    }

    override func tearDown() {
        coordinator = nil

        super.tearDown()
    }

    func testCoordinatorArrayInitializedOfEmptyArray() {
        XCTAssertTrue(coordinator.childCoordinators.isEmpty, "childCoordinators array should be empty")
    }

    func testCoordinatorAddChildCoordinator() {

        coordinator.addChildCoordinator(coordinator)
        XCTAssertTrue(coordinator.childCoordinators.first is BaseCoordinator, "childCoordinators first element should be an instance of BaseCoordinator")
        XCTAssertTrue(coordinator.childCoordinators.count == 1, "childCoordinators count should be 1")

        let newCoordinator = BaseCoordinator(router: Router())
        coordinator.addChildCoordinator(newCoordinator)
        XCTAssertTrue(coordinator.childCoordinators.count == 2, "childCoordinators count should be 2")
    }

    func testCoordinatorRemoveChildCoordinator() {

        coordinator.addChildCoordinator(coordinator)
        XCTAssertTrue(coordinator.childCoordinators.first is BaseCoordinator, "childCoordinators first element should be an instance of BaseCoordinator")
        coordinator.removeChildCoordinator(coordinator)
        XCTAssertTrue(coordinator.childCoordinators.isEmpty, "childCoordinators array should be empty")
        coordinator.removeChildCoordinator(coordinator)
        XCTAssertTrue(coordinator.childCoordinators.isEmpty, "childCoordinators array should be empty")
    }
}
