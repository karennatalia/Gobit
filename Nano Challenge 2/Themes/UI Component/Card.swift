//
//  Card.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

func createCard() -> UIView {
    let card = UIView()
    card.layer.cornerRadius = 12
    card.layer.borderWidth = 0.5
    card.layer.borderColor = UIColor.lightGray.cgColor
    card.backgroundColor = .white
    return card
}

func createHorizontalLine() -> UIView {
    let line = UIView()
    line.backgroundColor = .lightGray
    line.setHeight(height: 1)
    return line
}

class EmptyState: UIView {
    
    lazy var image: UIImageView = createImage(imageName: "questionmark.app")
    lazy var stateTitle: UILabel = createGreyRegularLabel(text: "State Title", size: 16, alignment: .center)
    lazy var stateDesc: UILabel = createGreyRegularLabel(text: "State Desc", size: 12, alignment: .center)
    
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

class NavBar: UIView {
    var leftButton: UIButton?
    var rightButton: UIButton?
    
    required init() {
        super.init(frame: CGRect(x: UIScreen.main.bounds.width / 2, y: 0, width: UIScreen.main.bounds.width, height: 300))
        
        leftButton = UIButton()
        rightButton = UIButton()
        
        self.backgroundColor = .white
        self.setHeight(height: 61)
        self.setWidth(width: UIScreen.main.bounds.width)
        
        self.addSubview(leftButton!)
        self.addSubview(rightButton!)
        
        leftButton!.setTitle("Cancel", for: .normal)
        leftButton!.setTitleColor(UIColor.primGreen, for: .normal)
        rightButton!.setTitle("Done", for: .normal)
        rightButton!.setTitleColor(UIColor.primGreen, for: .normal)
        
        leftButton!.centerY(inView: self)
        leftButton!.anchor(left: self.leftAnchor, paddingLeft: 16)
        rightButton!.centerY(inView: self)
        rightButton!.anchor(right: self.rightAnchor, paddingRight: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NavBarClose: UIView {
    var rightButton: UIButton?
    
    required init() {
        super.init(frame: .zero)
        
        rightButton = UIButton()
        
        self.backgroundColor = .white
        self.setHeight(height: 61)
        self.setWidth(width: UIScreen.main.bounds.width)
        
        self.addSubview(rightButton!)
        
        rightButton!.setTitle("Close", for: .normal)
        rightButton!.setTitleColor(UIColor.primGreen, for: .normal)
        
        rightButton!.centerY(inView: self)
        rightButton!.anchor(right: self.rightAnchor, paddingRight: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
