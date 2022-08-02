//
//  GoalTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import UIKit

class GoalTableViewCell: UITableViewCell {

    lazy var goalImage: UIImageView = CustomImage(imageName: "face.smiling")
    lazy var goalTitle: UILabel = CustomLabel(text: "Goal Title", style: FontStyle.titleBold, alignment: .left, color: .black)
    lazy var goalDate: UILabel = CustomLabel(text: "Started xx July 2022", style: FontStyle.detail, alignment: .center, color: .black)
    lazy var cardBackground: UIView = CustomCard()
    
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
