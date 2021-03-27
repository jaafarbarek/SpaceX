//
//  UINavigationControllerMock.swift
//  SpaceXTests
//
//  Created by Jaafar Barek on 27/03/2021.
//

import UIKit
@testable import SpaceX

class UINavigationControllerMock: UINavigationController, Presentable {

    var didPresentViewController = false
    var didDismissViewController = false
    var didPushViewController = false
    var didPopViewController = false
    var didPopToRootViewController = false

    var currentPushedViewController: UIViewController?

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)

        didPresentViewController = true
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)

        didDismissViewController = true
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)

        currentPushedViewController = viewController
        didPushViewController = true
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        didPopViewController = true

        return currentPushedViewController
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        didPopToRootViewController = true

        guard let currentPushedViewController = currentPushedViewController else {
            return nil
        }

        return [currentPushedViewController]
    }
}
