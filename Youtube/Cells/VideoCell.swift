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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift - Blank Space"
        return label
    }()

    let subTitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorSwiftVEVO • 1,600,000,000 views • 2 years ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        return textView
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.subTitleTextView)
        
        addConstraintsWithVisualFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithVisualFormat(format: "H:|[v0]|", views: separatorView)
        addConstraintsWithVisualFormat(format: "H:|-16-[v0(44)]", views: userImageProfileView)
        
        addConstraintsWithVisualFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userImageProfileView, separatorView)

        //TitleLabel top constraint
        addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .left, relatedBy: .equal, toItem: self.userImageProfileView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .right, relatedBy: .equal, toItem: self.thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //Top Constraint
        addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))

        //SubTitleLabel top constraint
        addConstraint(NSLayoutConstraint(item: self.subTitleTextView, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: self.subTitleTextView, attribute: .left, relatedBy: .equal, toItem: self.userImageProfileView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: self.subTitleTextView, attribute: .right, relatedBy: .equal, toItem: self.thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //Top Constraint
        addConstraint(NSLayoutConstraint(item: self.subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
    }
}
