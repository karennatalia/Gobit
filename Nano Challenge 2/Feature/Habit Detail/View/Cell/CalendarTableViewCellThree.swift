//
//  CalendarTableViewCellThree.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class CalendarTableViewCellThree: UITableViewCell {

    lazy var dateCollection: UICollectionView = createCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraint()
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        self.backgroundColor = .clear
        self.contentView.addSubview(dateCollection)
    }
    
    func setupConstraint() {
        dateCollection.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor)
    }
    
    func setupCollectionView() {
        dateCollection.register(DateCollectionViewCell.self, forCellWithReuseIdentifier: "dateCell")
    }
}
