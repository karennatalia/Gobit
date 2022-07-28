//
//  PickScheduleView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class PickScheduleView: UIView {
    
    private lazy var dayTableView: UITableView = createInsetGroupedTableView(isScrollable: false)

    let vc: PickScheduleViewController?
    
    required init(vc: PickScheduleViewController) {
        self.vc = vc
        super.init(frame: .zero)
        
        setupUI()
        setupConstraint()
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = UIColor.bgColor
        self.addSubview(dayTableView)
    }
    
    func setupConstraint() {
        dayTableView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor)
    }
    
    func setupTableView() {
        dayTableView.register(UITableViewCell.self, forCellReuseIdentifier: "dayCell")
        dayTableView.delegate = vc
        dayTableView.dataSource = vc
    }
    
}
