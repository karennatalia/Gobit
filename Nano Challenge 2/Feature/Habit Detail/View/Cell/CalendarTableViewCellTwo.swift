//
//  CalendarTableViewCellTwo.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class CalendarTableViewCellTwo: UITableViewCell {
    
    private lazy var sunday: UILabel = CustomLabel(text: "S", style: FontStyle.subHeader, alignment: .center, color: .primGreen)
    private lazy var monday: UILabel = CustomLabel(text: "M", style: FontStyle.subHeader, alignment: .center, color: .primGreen)
    private lazy var tuesday: UILabel = CustomLabel(text: "T", style: FontStyle.subHeader, alignment: .center, color: .primGreen)
    private lazy var wednesday: UILabel = CustomLabel(text: "W", style: FontStyle.subHeader, alignment: .center, color: .primGreen)
    private lazy var thursday: UILabel = CustomLabel(text: "T", style: FontStyle.subHeader, alignment: .center, color: .primGreen)
    private lazy var friday: UILabel = CustomLabel(text: "F", style: FontStyle.subHeader, alignment: .center, color: .primGreen)
    private lazy var saturday: UILabel = CustomLabel(text: "S", style: FontStyle.subHeader, alignment: .center, color: .primGreen)
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
        dayStack.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingLeft: 40, paddingRight: 40)
//        sunday.anchor(width: 34, height: 34)
//        monday.anchor(width: 34, height: 34)
//        tuesday.anchor(width: 34, height: 34)
//        wednesday.anchor(width: 34, height: 34)
//        thursday.anchor(width: 34, height: 34)
//        friday.anchor(width: 34, height: 34)
//        saturday.anchor(width: 34, height: 34)
    }
}
