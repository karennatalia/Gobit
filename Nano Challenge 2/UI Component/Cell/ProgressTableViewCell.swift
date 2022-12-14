//
//  ProgressTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    private lazy var cardBackgroundLeft: UIView = CustomCard()
    private lazy var cardBackgroundMid: UIView = CustomCard()
    private lazy var cardBackgroundRight: UIView = CustomCard()
    private lazy var doneText: UILabel = CustomLabel(text: "Done", style: FontStyle.detail, alignment: .center, color: .black)
    lazy var doneNumber: UILabel = CustomLabel(text: "XX", style: FontStyle.hugeText, alignment: .center, color: .secGreen)
    private lazy var timesDoneText: UILabel = CustomLabel(text: "times", style: FontStyle.detail, alignment: .center, color: .black)
    private lazy var missedText: UILabel = CustomLabel(text: "Missed", style: FontStyle.detail, alignment: .center, color: .black)
    lazy var missedNumber: UILabel = CustomLabel(text: "XX", style: FontStyle.hugeText, alignment: .center, color: .secGreen)
    private lazy var timesMissedText: UILabel = CustomLabel(text: "times", style: FontStyle.detail, alignment: .center, color: .black)
    private lazy var consistentText: UILabel = CustomLabel(text: "Consistency", style: FontStyle.detail, alignment: .center, color: .black)
    lazy var consistentNumber: UILabel = CustomLabel(text: "XX%", style: FontStyle.hugeText, alignment: .center, color: .secGreen)
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
        self.contentView.addSubview(cardBackgroundLeft)
        self.contentView.addSubview(cardBackgroundMid)
        self.contentView.addSubview(cardBackgroundRight)
        cardBackgroundLeft.addSubview(doneText)
        cardBackgroundLeft.addSubview(doneNumber)
        cardBackgroundLeft.addSubview(timesDoneText)
        cardBackgroundMid.addSubview(missedText)
        cardBackgroundMid.addSubview(missedNumber)
        cardBackgroundMid.addSubview(timesMissedText)
        cardBackgroundRight.addSubview(consistentText)
        cardBackgroundRight.addSubview(consistentNumber)
    }
    
    func setupConstraint() {
        cardBackgroundLeft.anchor(top: self.topAnchor, left: self.leftAnchor, paddingLeft: 16)
        cardBackgroundLeft.setDimensions(width: (UIScreen.main.bounds.width - (16*4)) / 3, height: 80)
        
        cardBackgroundMid.anchor(top: self.topAnchor, left: cardBackgroundLeft.rightAnchor, right: cardBackgroundRight.leftAnchor, paddingLeft: 16, paddingRight: 16)
        cardBackgroundMid.setDimensions(width: (UIScreen.main.bounds.width - (16*4)) / 3, height: 80)
        
        cardBackgroundRight.anchor(top: self.topAnchor, left: cardBackgroundMid.rightAnchor, right: self.rightAnchor, paddingRight: 16)
        cardBackgroundRight.setDimensions(width: (UIScreen.main.bounds.width - (16*4)) / 3, height: 80)
        
        doneText.anchor(top: cardBackgroundLeft.topAnchor, paddingTop: 8)
        doneText.centerX(inView: cardBackgroundLeft)
        
        doneNumber.anchor(top: doneText.bottomAnchor)
        doneNumber.centerX(inView: cardBackgroundLeft)
        
        timesDoneText.anchor(top: doneNumber.bottomAnchor)
        timesDoneText.centerX(inView: cardBackgroundLeft)
        
        missedText.anchor(top: cardBackgroundMid.topAnchor, paddingTop: 8)
        missedText.centerX(inView: cardBackgroundMid)
        
        missedNumber.anchor(top: missedText.bottomAnchor)
        missedNumber.centerX(inView: cardBackgroundMid)
        
        timesMissedText.anchor(top: missedNumber.bottomAnchor)
        timesMissedText.centerX(inView: cardBackgroundMid)
        
        consistentText.anchor(top: cardBackgroundRight.topAnchor, paddingTop: 8)
        consistentText.centerX(inView: cardBackgroundRight)
        
        consistentNumber.anchor(top: consistentText.bottomAnchor, paddingTop: 4)
        consistentNumber.centerX(inView: cardBackgroundRight)
    }
}
