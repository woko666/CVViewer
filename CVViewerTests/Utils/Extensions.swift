//
//  Extensions.swift
//  CVViewerTests
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func initializeViews(inWindow: Bool = false) {
        if inWindow {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.makeKeyAndVisible()
            window.rootViewController = self
        }
        beginAppearanceTransition(true, animated: false)
        endAppearanceTransition()
    }
    
}
