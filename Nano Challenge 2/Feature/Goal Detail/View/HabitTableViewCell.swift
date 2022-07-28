//
//  HabitTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class HabitTableViewCell: UITableViewCell {

    lazy var cardBackground: UIView = createCard()
    lazy var habitTitle: UILabel = createBlackSemiboldLabel(text: "Habit Title", size: 16, alignment: .left)
    lazy var habitDate: UILabel = createBlackRegularLabel(text: "Started xx July 2022", size: 12, alignment: .left)
    
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
        self.contentView.addSubview(habitTitle)
        self.contentView.addSubview(habitDate)
    }
    
    func setupConstraint() {
        cardBackground.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 8, paddingRight: 16)
        habitTitle.anchor(top: cardBackground.topAnchor, left: cardBackground.leftAnchor, paddingTop: 12, paddingLeft: 16)
        habitDate.anchor(top: habitTitle.bottomAnchor, left: cardBackground.leftAnchor, paddingTop: 2, paddingLeft: 16)
    }
}
