//
//  PickScheduleTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class PickScheduleTableViewCell: UITableViewCell {
    
    lazy var formTitle: UILabel = createBlackRegularLabel(text: "Schedule", size: 17, alignment: .left)
    lazy var pickedDayLabel: UILabel = createGreyRegularLabel(text: "day", size: 17, alignment: .right)
    lazy var pickButton: UIButton = createImageButton(imageName: "chevron.right", color: .lightGray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        self.contentView.addSubview(formTitle)
        self.contentView.addSubview(pickButton)
        self.contentView.addSubview(pickedDayLabel)
    }
    
    func setupConstraint() {
        formTitle.centerY(inView: self)
        formTitle.anchor(left: self.leftAnchor, paddingLeft: 16)
        pickButton.centerY(inView: self)
        pickButton.anchor(right: self.rightAnchor, paddingRight: 16)
        pickedDayLabel.centerY(inView: self)
        pickedDayLabel.anchor(right: pickButton.leftAnchor, paddingRight: 4)
    }
}
