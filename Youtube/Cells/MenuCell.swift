//
//  MenuCell.swift
//  Youtube
//
//  Created by Rajiv Deshmukh on 10/27/18.
//  Copyright © 2018 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    static var tintColorValue: UIColor {
        return UIColor(red: 91/255, green: 14/255, blue: 12/255, alpha: 1)
    }
    
    let imageView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = MenuCell.tintColorValue
        return view
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? .white : MenuCell.tintColorValue
        }
    }

    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? .white : MenuCell.tintColorValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        self.addSubview(self.imageView)
        addConstraintsWithVisualFormat(format: "H:[v0(28)]", views: self.imageView)
        addConstraintsWithVisualFormat(format: "V:[v0(28)]", views: self.imageView)
        
        NSLayoutConstraint.activate([self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
        
//        addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
