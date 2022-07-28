//
//  GuidelinesTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import UIKit

class GuidelinesTableViewCell: UITableViewCell {

    private lazy var guidelinesLabel: UILabel = createGreenRegularLabel(text: "View Guidelines", size: 16, alignment: .left)
    private lazy var chevronButton: UIButton = createImageButton(imageName: "chevron.down", color: UIColor.primGreen)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraint()
        
        chevronButton.isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        self.contentView.addSubview(guidelinesLabel)
        self.contentView.addSubview(chevronButton)
        
        guidelinesLabel.addLeftIcon(imageName: "questionmark.circle", text: "View Guidelines")
    }
    
    func setupConstraint() {
        guidelinesLabel.centerY(inView: self)
        guidelinesLabel.anchor(left: self.leftAnchor, paddingLeft: 16)
        
        chevronButton.centerY(inView: self)
        chevronButton.anchor(right: self.rightAnchor, paddingRight: 16)
    }

}
