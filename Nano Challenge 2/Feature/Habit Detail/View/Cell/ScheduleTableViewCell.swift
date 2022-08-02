//
//  ScheduleTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    private lazy var cardBackground: UIView = CustomCard()
    lazy var sunday: UILabel = CustomLabel(text: "S", style: FontStyle.subHeader, alignment: .center, color: .black)
    lazy var monday: UILabel = CustomLabel(text: "M", style: FontStyle.subHeader, alignment: .center, color: .black)
    lazy var tuesday: UILabel = CustomLabel(text: "T", style: FontStyle.subHeader, alignment: .center, color: .black)
    lazy var wednesday: UILabel = CustomLabel(text: "W", style: FontStyle.subHeader, alignment: .center, color: .black)
    lazy var thursday: UILabel = CustomLabel(text: "T", style: FontStyle.subHeader, alignment: .center, color: .black)
    lazy var friday: UILabel = CustomLabel(text: "F", style: FontStyle.subHeader, alignment: .center, color: .black)
    lazy var saturday: UILabel = CustomLabel(text: "S", style: FontStyle.subHeader, alignment: .center, color: .black)
    private lazy var dayStack: UIStackView = UIStackView()
    
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
        
        dayStack.axis = .horizontal
        dayStack.alignment = .center
        dayStack.distribution = .equalSpacing
        dayStack.spacing = 8
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
