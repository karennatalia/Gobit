//
//  DateCollectionViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    lazy var dateLabel: UILabel = createBlackRegularLabel(text: "20", size: 16, alignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .clear
        self.contentView.addSubview(dateLabel)
        dateLabel.setGreenCircle(width: 34)
    }
    
    func setupConstraint() {
        dateLabel.centerX(inView: self)
        dateLabel.centerY(inView: self)
        dateLabel.setDimensions(width: 34, height: 34)
    }
}
