//
//  ToDoTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    var didHabitTapped: () -> ()  = { }
    
    lazy var title: UILabel = CustomLabel(text: "Habit Title", style: FontStyle.title, alignment: .left, color: .black)
    lazy var doneButton = CustomFilledButton(title: "Done")
    private lazy var cardBackground: UIView = CustomCard()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraint()
        
        doneButton.addTarget(self, action: #selector(didHabit), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        self.backgroundColor = .clear
        self.contentView.addSubview(cardBackground)
        self.contentView.addSubview(title)
        self.contentView.addSubview(doneButton)
    }
    
    func setupConstraint() {
        cardBackground.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 8, paddingRight: 16)
        title.centerY(inView: cardBackground)
        title.anchor(left: cardBackground.leftAnchor, paddingLeft: 16)
        doneButton.centerY(inView: cardBackground)
        doneButton.anchor(right: cardBackground.rightAnchor, paddingRight: 16, width: 72, height: 30)
    }
    
    @objc func didHabit() {
        didHabitTapped()
    }
}
