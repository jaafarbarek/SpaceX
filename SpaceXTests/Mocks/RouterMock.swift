//
//  RouterMock.swift
//  SpaceXTests
//
//  Created by Jaafar Barek on 27/03/2021.
//

import UIKit
@testable import SpaceX

protocol RouterMockType: RouterType {
    var navigationStack: [UIViewController] {get}
    var presented: UIViewController? {get}
}

class RouterMock: RouterMockType {

    private(set) var navigationStack: [UIViewController] = []
    private(set) var presented: UIViewController?
    private var completions: [UIViewController : () -> Void] = [:]

    lazy var navigationController: UINavigationController = {
        return UINavigationController()
    }()

    var rootViewController: UIViewController? {
        return nil
    }

    func present(_ module: Presentable, animated: Bool, presentationStyle: UIModalPresentationStyle) {
        presented = module.toPresent()
    }

    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        presented = nil
    }

    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?) {
        let controller = module.toPresent()

        // Avoid pushing UINavigationController onto stack
        guard controller is UINavigationController == false else {
            return
        }

        if let completion = completion {
            completions[controller] = completion
        }

        navigationStack.append(controller)
    }

    func popModule(animated: Bool) {
        let controller = navigationStack.removeLast()
        runCompletion(for: controller)
    }

    func setRootModule(_ module: Presentable, hideBar: Bool) {
        navigationStack = [module.toPresent()]
    }

    func dismissToRootModule(animated: Bool) {
        navigationController.dismiss(animated: animated) {
            self.popToRootModule(animated: animated)
        }
    }

    func popToRootModule(animated: Bool) {
        guard let first = navigationStack.first else { return }

        navigationStack.forEach { controller in
            runCompletion(for: controller)
        }

        navigationStack = [first]
    }

    func popToViewController(viewController: UIViewController) {
        navigationController.popToViewController(viewController, animated: true)
    }

    func toPresent() -> UIViewController {
        return navigationController
    }

    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else {
            return
        }
        completion()
        completions.removeValue(forKey: controller)
    }
}
