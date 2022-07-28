//
//  GuidelinesView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 29/07/22.
//

import UIKit

class GuidelinesView: UIView {

    private lazy var navBar = NavBarClose()
    private lazy var navTitle: UILabel = createBlackSemiboldLabel(text: "Level Guidelines", size: 17, alignment: .center)
    private lazy var guidelinesText: UITextView = createTextView()
    
    var vc: GuidelinesViewController?
    
    required init(vc: GuidelinesViewController) {
        self.vc = vc
        super.init(frame: .zero)
        
        setupUI()
        setupConstraint()
        
        navBar.rightButton?.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .bgColor
        self.addSubview(navBar)
        navBar.addSubview(navTitle)
        self.addSubview(guidelinesText)
        guidelinesText.sizeToFit()
        guidelinesText.isScrollEnabled = false
        guidelinesText.backgroundColor = .clear
        guidelinesText.attributedText = vc?.guidelines
    }
    func setupConstraint() {
        navBar.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, height: 62)
        navTitle.centerX(inView: navBar)
        navTitle.centerY(inView: navBar)
        guidelinesText.anchor(top: navBar.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
    }
    
    @objc func closeAction() {
        vc?.dismiss(animated: true)
    }

}
