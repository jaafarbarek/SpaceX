//
//  RouterUnitTests.swift
//  SpaceXTests
//
//  Created by Jaafar Barek on 27/03/2021.
//

import XCTest
@testable import SpaceX

class RouterUnitTests: XCTestCase {

    var router: Router!
    var navigationController: UINavigationControllerMock!

    var firstViewController: LaunchListViewController!
    var secondViewController: RocketDetailsViewController!

    override func setUp() {
        super.setUp()

        navigationController = UINavigationControllerMock()
        router = Router(navigationController: navigationController)

        firstViewController = LaunchListViewController.instantiate()
        firstViewController.viewModel = LaunchListViewModel(dependencies: DependencyProvider())
        secondViewController = RocketDetailsViewController.instantiate()
        secondViewController.viewModel = RocketDetailsViewModel(dependencies: DependencyProvider(), launch: Launch(name: nil,
                                                                                                                   details: nil,
                                                                                                                   upcoming: nil,
                                                                                                                   success: nil,
                                                                                                                   rocket: nil,
                                                                                                                   date: nil,
                                                                                                                   flightNumber: nil))
    }

    override func tearDown() {
        navigationController = nil
        router = nil

        firstViewController = nil
        secondViewController = nil

        super.tearDown()
    }

    func testRouter_initializedNavigationController_propertyMatchPassedNavigationController() {
        XCTAssertTrue(router.navigationController == navigationController, "navigationController property should be equaled passed one")
    }

    func testRouter_initializedEmptyNavigationController_hasEmptyViewControllersArray() {
        XCTAssertTrue(navigationController.viewControllers.isEmpty, "viewControllers array should be empty")
    }

    func testRouter_initializedEmptyNavigationController_hasNilRootViewController() {
        XCTAssertNil(router.rootViewController, "rootViewController should be nil")
    }

    func testRouter_setRootModule_hasRootViewController() {
        router.setRootModule(firstViewController)
        XCTAssertNotNil(router.rootViewController, "rootViewController should not be nil")
        XCTAssertTrue(router.rootViewController! == firstViewController, "rootViewController should equal firstViewController")
    }

    func testRouter_presentModule_navigationControllerPresentedViewController() {
        router.setRootModule(firstViewController)

        XCTAssertFalse(navigationController.didPresentViewController, "didPresentViewController should be false")
        router.present(secondViewController, presentationStyle: .overFullScreen)

        XCTAssertTrue(navigationController.didPresentViewController, "didPresentViewController should be true")
    }

    func testRouter_dismissModuleAfterPresentation_navigationControllerPresentedControllerIsEmpty() {
        router.setRootModule(firstViewController)
        router.present(secondViewController, presentationStyle: .overFullScreen)

        XCTAssertFalse(navigationController.didDismissViewController, "didDismissViewController should be false")
        router.dismissModule()
        XCTAssertTrue(navigationController.didDismissViewController, "didDismissViewController should be true")
    }

    func testRouter_pushModule_navigationControllerPushedViewController() {
        router.setRootModule(firstViewController)

        XCTAssertFalse(navigationController.didPushViewController, "didPushViewController should be false")
        router.push(secondViewController)
        XCTAssertTrue(navigationController.didPushViewController, "didPushViewController should be true")
    }

    func testRouter_pushModuleWithNavigationControllertoPresent_navigationControllerDidNotPushViewController() {
        router.setRootModule(firstViewController)

        XCTAssertFalse(navigationController.didPushViewController, "didPushViewController should be false")
        router.push(UINavigationControllerMock())
        XCTAssertFalse(navigationController.didPushViewController, "didPushViewController should be false")
    }

    func testRouter_popModule_navigationControllerPopViewController() {
        router.setRootModule(firstViewController)
        router.push(secondViewController)

        XCTAssertFalse(navigationController.didPopViewController, "didPopViewController should be false")
        router.popModule()
        XCTAssertTrue(navigationController.didPopViewController, "didPopViewController should be true")
    }

    func testRouter_popModule_completionShouldBeExecuted() {
        router.setRootModule(firstViewController)

        let completionExpectation = self.expectation(description: "completionExpectation")

        router.push(secondViewController, animated: false) {
            completionExpectation.fulfill()
        }

        router.popModule()

        wait(for: [completionExpectation], timeout: 5)
    }

    func testRouter_popToRootModule_navigationControllerPopViewController() {
        router.setRootModule(firstViewController)
        router.push(secondViewController)

        XCTAssertFalse(navigationController.didPopToRootViewController, "didPopToRootViewController should be false")
        router.popToRootModule(animated: false)
        XCTAssertTrue(navigationController.didPopToRootViewController, "didPopToRootViewController should be true")
    }

    func testRouter_popToRootModule_completionsShouldBeExecuted() {
        router.setRootModule(firstViewController)

        let completionExpectation = self.expectation(description: "completionExpectation")

        router.push(secondViewController, animated: false) {
            completionExpectation.fulfill()
        }

        router.popToRootModule(animated: false)

        wait(for: [completionExpectation], timeout: 5)
    }

}
