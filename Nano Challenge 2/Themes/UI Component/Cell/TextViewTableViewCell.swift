//
//  TextViewTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {
    
    lazy var textView: UITextView = CustomTextView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        self.contentView.addSubview(textView)
    }
    
    func setupConstraint() {
        textView.centerY(inView: self)
        textView.anchor(left: self.leftAnchor, right: self.rightAnchor, paddingLeft: 16, paddingRight: 16, height: 200)
    }
}
