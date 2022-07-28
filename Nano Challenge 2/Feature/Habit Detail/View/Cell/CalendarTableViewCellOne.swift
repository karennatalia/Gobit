//
//  CalendarTableViewCellOne.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit
import SwiftUI

class CalendarTableViewCellOne: UITableViewCell {

    private lazy var monthTitle: UILabel = createBlackSemiboldLabel(text: "July 2022", size: 16, alignment: .left)
    private lazy var leftButton: UIButton = createImageButton(imageName: "chevron.left", color: UIColor.primGreen)
    private lazy var rightButton: UIButton = createImageButton(imageName: "chevron.right", color: UIColor.primGreen)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraint()
        
        leftButton.addTarget(self, action: #selector(testClick), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        self.backgroundColor = .clear
        self.contentView.addSubview(monthTitle)
        self.contentView.addSubview(rightButton)
        self.contentView.addSubview(leftButton)
    }
    
    func setupConstraint() {
        monthTitle.centerY(inView: self)
        monthTitle.anchor(left: self.leftAnchor, paddingLeft: 32)
        
        rightButton.centerY(inView: self)
        rightButton.anchor(right: self.rightAnchor, paddingRight: 32, width: 18, height: 18)
        
        leftButton.centerY(inView: self)
        leftButton.anchor(right: rightButton.leftAnchor, paddingRight: 4, width: 18, height: 18)
    }
    
    @objc func testClick() {
        print("clicked")
    }
}
