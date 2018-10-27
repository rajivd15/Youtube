//
//  Extensions.swift
//  Youtube
//
//  Created by Rajiv Deshmukh on 10/27/18.
//  Copyright © 2018 Rajiv Deshmukh. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addConstraintsWithVisualFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, value) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = value
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
