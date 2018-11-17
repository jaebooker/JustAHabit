//
//  UIVIewControllerExtensions.swift
//  JustAHabit
//
//  Created by Jaeson Booker on 11/15/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
