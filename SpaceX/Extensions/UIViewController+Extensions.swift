//
//  UIViewController+Extensions.swift
//  Neo
//
//  Created by Jaafar Barek on 25/03/2021.
//  Copyright © 2021 Neo. All rights reserved.
//

import UIKit

// MARK: - HUD Handling Methods
extension UIViewController {
    func showHUD() {
        guard let currentWindow = UIApplication.shared.keyWindow else { return }

        let hasLoaderHUD = currentWindow.subviews.contains { ($0 as? LoaderHUD)?.presentingViewController == self }
        guard !hasLoaderHUD else { return }

        let loaderHUD = LoaderHUD(frame: UIScreen.main.bounds, viewController: self)
        currentWindow.addSubview(loaderHUD)
    }

    func hideHUD() {
        
        guard let currentWindow = UIApplication.shared.keyWindow else { return }
        let loaderHUD = currentWindow.subviews.filter { view in
            guard let loader = view as? LoaderHUD else { return false }

            return loader.presentingViewController == self || loader.presentingViewController == nil
        }
        loaderHUD.forEach { $0.removeFromSuperview() }
    }
}
