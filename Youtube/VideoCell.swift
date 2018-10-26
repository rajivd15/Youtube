//
//  VideoCell.swift
//  Youtube
//
//  Created by Rajiv Deshmukh on 10/25/18.
//  Copyright © 2018 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userImageProfileView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        self.addSubview(self.thumbnailImageView)
        self.addSubview(self.separatorView)
        self.addSubview(self.userImageProfileView)
        
        addConstraintsWithVisualFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithVisualFormat(format: "H:|[v0]|", views: separatorView)
        addConstraintsWithVisualFormat(format: "H:|-16-[v0(44)]", views: userImageProfileView)
        
        addConstraintsWithVisualFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userImageProfileView, separatorView)
    }
}

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
