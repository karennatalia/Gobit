//
//  TextGuidelinesTableViewCell.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import UIKit

class TextGuidelinesTableViewCell: UITableViewCell {

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
        
        textView.sizeToFit()
        textView.isScrollEnabled = false
    }
    
    func setupConstraint() {
        textView.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingLeft: 16, paddingRight: 16)
    }

}
