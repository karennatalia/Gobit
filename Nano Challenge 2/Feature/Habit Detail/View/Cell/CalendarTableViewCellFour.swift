//
//  CalendarTableViewCellFour.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class CalendarTableViewCellFour: UITableViewCell {
    
    private lazy var greenCircle: UILabel = CustomLabel(text: "", style: FontStyle.detail, alignment: .center, color: .black)
    private lazy var greenDesc: UILabel = CustomLabel(text: "You did the habit!", style: FontStyle.detail, alignment: .left, color: .black)
    private lazy var outlineCircle: UILabel = CustomLabel(text: "", style: FontStyle.detail, alignment: .center, color: .black)
    private lazy var outlineDesc: UILabel = CustomLabel(text: "You missed the habit :(", style: FontStyle.detail, alignment: .left, color: .black)
    
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
        self.contentView.addSubview(greenCircle)
        self.contentView.addSubview(greenDesc)
        self.contentView.addSubview(outlineCircle)
        self.contentView.addSubview(outlineDesc)
        
        greenCircle.setGreenCircle(width: 16)
        outlineCircle.setOutlineCircle(width: 16)
    }
    
    func setupConstraint() {
        greenCircle.anchor(left: self.leftAnchor, paddingLeft: 32, width: 16, height: 16)
        greenCircle.centerY(inView: self)
        
        greenDesc.centerY(inView: self)
        greenDesc.anchor(left: greenCircle.rightAnchor, paddingLeft: 4)
        
        outlineCircle.anchor(left: greenDesc.rightAnchor, paddingLeft: 32, width: 16, height: 16)
        outlineCircle.centerY(inView: self)
        
        outlineDesc.centerY(inView: self)
        outlineDesc.anchor(left: outlineCircle.rightAnchor, paddingLeft: 4)
    }
}
