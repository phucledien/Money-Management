//
//  Appearance.swift
//  professional-app
//
//  Created by Phuc Le Dien on 3/20/19.
//  Copyright © 2019 phucld. All rights reserved.
//

import UIKit

struct Appearance {
    static func setGlobalAppearance() {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .skyBlue
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
