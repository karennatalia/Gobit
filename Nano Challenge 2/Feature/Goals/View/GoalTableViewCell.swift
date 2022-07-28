//
//  GoalTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import UIKit

class GoalTableViewCell: UITableViewCell {

    lazy var goalImage: UIImageView = createImage(imageName: "face.smiling")
    lazy var goalTitle: UILabel = createBlackSemiboldLabel(text: "Goal Title", size: 14, alignment: .left)
    lazy var goalDate: UILabel = createBlackRegularLabel(text: "Started xx July 2022", size: 12, alignment: .center)
    lazy var cardBackground: UIView = createCard()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        self.backgroundColor = .clear
        self.contentView.addSubview(cardBackground)
        self.contentView.addSubview(goalImage)
        self.contentView.addSubview(goalTitle)
        self.contentView.addSubview(goalDate)
    }
    
    func setupConstraint() {
        cardBackground.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 8, paddingRight: 16)
        goalImage.centerY(inView: cardBackground)
        goalImage.anchor(left: cardBackground.leftAnchor, paddingLeft: 24)
        goalImage.setDimensions(width: 50, height: 50)
        goalTitle.anchor(top: cardBackground.topAnchor, left: goalImage.rightAnchor, paddingTop: 24, paddingLeft: 16)
        goalDate.anchor(top: goalTitle.bottomAnchor, left: goalImage.rightAnchor, paddingLeft: 16)
    }
}
