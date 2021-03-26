//
//  CustomNavigationController.swift
//  Neo
//
//  Created by Matic on 4/16/20.
//  Copyright © 2020 Neo. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Fonts.font(name: .font500,
                                                                                     size: 17.0)]
        // Hide Back Button text label without clearing the text color
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(
            UIOffset(horizontal: -1000.0,
                     vertical: 0.0), for: .default)

        navigationItem.largeTitleDisplayMode = .always

        // change back icon & set its color
        if let backArrowImage = UIImage(named: "navigation_back_arrow") {
            let backArrowImageShift: CGFloat = 20
            UIGraphicsBeginImageContextWithOptions(CGSize(width: backArrowImage.size.width + backArrowImageShift,
                                                          height: backArrowImage.size.height),
                                                   false,
                                                   0)
            backArrowImage.draw(at: CGPoint(x: backArrowImageShift, y: 0))
            let finalBackArrowImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            navigationBar.backIndicatorImage = finalBackArrowImage
            navigationBar.backIndicatorTransitionMaskImage = finalBackArrowImage
            navigationBar.tintColor = .gray
        }

        setDefaultNavigationBarBackgroundColor()
    }

    func setDefaultNavigationBarBackgroundColor() {
        UINavigationBar.appearance().barTintColor = nil
        navigationBar.isTranslucent = false
    }

    func setBarButtonItemColor(color: UIColor) {
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: color], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: color], for: .highlighted)
    }

    func clearBarButtonItemColor() {
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.clear], for: .highlighted)
    }
}
