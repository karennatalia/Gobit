//
//  ToggleTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class ToggleTableViewCell: UITableViewCell {

    lazy var formTitle: UILabel = CustomLabel(text: "Remind Me", style: FontStyle.systemDefaultBold, alignment: .left, color: .black)
    lazy var toggle: UISwitch = createToggle()
    
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
        self.contentView.addSubview(toggle)
    }
    
    func setupConstraint() {
        formTitle.centerY(inView: self)
        formTitle.anchor(left: self.leftAnchor, paddingLeft: 16)
        toggle.centerY(inView: self)
        toggle.anchor(right: self.rightAnchor, paddingRight: 16)
    }
}
