//
//  EmptyState.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 02/08/22.
//

import Foundation
import UIKit

class EmptyState: UIView {
    
    lazy var image: UIImageView = CustomImage(imageName: "questionmark.app")
    lazy var stateTitle: UILabel = CustomLabel(text: "State Title", style: FontStyle.subHeader, alignment: .center, color: .lightGray)
    lazy var stateDesc: UILabel = CustomLabel(text: "State Desc", style: FontStyle.detail, alignment: .center, color: .lightGray)
    
    required init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .clear
        setupUI()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(image)
        self.addSubview(stateTitle)
        self.addSubview(stateDesc)
        
        image.tintColor = UIColor.systemGray3
    }
    
    func setupConstraint() {
        image.centerX(inView: self)
        image.anchor(top: self.topAnchor, paddingTop: 24, width: 100, height: 100)
        
        stateTitle.centerX(inView: self)
        stateTitle.anchor(top: image.bottomAnchor, paddingTop: 8)
        
        stateDesc.centerX(inView: self)
        stateDesc.anchor(top: stateTitle.bottomAnchor, paddingTop: 4)
    }
}
