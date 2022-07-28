//
//  ScheduleTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    private lazy var cardBackground: UIView = createCard()
    lazy var sunday: UILabel = createBlackRegularLabel(text: "S", size: 16, alignment: .center)
    lazy var monday: UILabel = createBlackRegularLabel(text: "M", size: 16, alignment: .center)
    lazy var tuesday: UILabel = createBlackRegularLabel(text: "T", size: 16, alignment: .center)
    lazy var wednesday: UILabel = createBlackRegularLabel(text: "W", size: 16, alignment: .center)
    lazy var thursday: UILabel = createBlackRegularLabel(text: "T", size: 16, alignment: .center)
    lazy var friday: UILabel = createBlackRegularLabel(text: "F", size: 16, alignment: .center)
    lazy var saturday: UILabel = createBlackRegularLabel(text: "S", size: 16, alignment: .center)
    private lazy var dayStack: UIStackView = createStackViewHorizontal()
    
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
        self.contentView.addSubview(dayStack)
        
        dayStack.addArrangedSubview(sunday)
        dayStack.addArrangedSubview(monday)
        dayStack.addArrangedSubview(tuesday)
        dayStack.addArrangedSubview(wednesday)
        dayStack.addArrangedSubview(thursday)
        dayStack.addArrangedSubview(friday)
        dayStack.addArrangedSubview(saturday)
    }
    
    func setupConstraint() {
        cardBackground.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingLeft: 16, paddingRight: 16)
        dayStack.anchor(top: cardBackground.topAnchor, left: cardBackground.leftAnchor, bottom: cardBackground.bottomAnchor, right: cardBackground.rightAnchor, paddingLeft: 24, paddingRight: 24)
        sunday.anchor(width: 34, height: 34)
        monday.anchor(width: 34, height: 34)
        tuesday.anchor(width: 34, height: 34)
        wednesday.anchor(width: 34, height: 34)
        thursday.anchor(width: 34, height: 34)
        friday.anchor(width: 34, height: 34)
        saturday.anchor(width: 34, height: 34)
    }

}
