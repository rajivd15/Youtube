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

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func loadImageUsingUrlString(urlString: String) {
        let url = URL(string: urlString)
        
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        let task = URLSession.shared.dataTask(with: url!) { [weak self] (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                self?.image = imageToCache
            }
        }
        task.resume()
    }
}
