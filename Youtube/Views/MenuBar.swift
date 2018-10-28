//
//  MenuBar.swift
//  Youtube
//
//  Created by Rajiv Deshmukh on 10/27/18.
//  Copyright © 2018 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let imageNames = ["home", "trending", "subscriptions", "account"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        view.dataSource = self
        view.delegate = self
        view.allowsMultipleSelection = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCellId")
        configureViews()
        let indexPath = IndexPath(item: 0, section: 0)
        self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        self.addSubview(self.collectionView)
        addConstraintsWithVisualFormat(format: "H:|[v0]|", views: self.collectionView)
        addConstraintsWithVisualFormat(format: "V:|[v0(50)]", views: self.collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCellId", for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        cell.imageView.tintColor = UIColor(red: 91/255, green: 14/255, blue: 12/255, alpha: 1)
        
        if indexPath.row == 0 {
            cell.isSelected = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 4, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
