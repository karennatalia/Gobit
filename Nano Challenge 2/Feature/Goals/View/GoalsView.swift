//
//  GoalsView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 25/07/22.
//

import UIKit

class GoalsView: UIView {
    
    lazy var goalsTableView: UITableView = createTableView(isScrollable: true)
    private lazy var emptyState = EmptyState()
    
    let vc: GoalsViewController?
    
    required init(vc: GoalsViewController) {
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
        self.addSubview(goalsTableView)
        self.addSubview(emptyState)
    }
    
    func setupConstraint() {
        goalsTableView.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.rightAnchor, paddingTop: 16)
        updateEmptyStateConstraint()
    }
    
    func updateEmptyStateConstraint() {
        if vc?.goalList.count == 0 {
            emptyState.isHidden = false
            emptyState.centerX(inView: self)
            emptyState.centerY(inView: self)
            setEmptyStateContent()
            emptyState.setDimensions(width: UIScreen.main.bounds.width - 32, height: 200)
        }
        else {
            emptyState.isHidden = true
        }
    }
    
    func setupTableView() {
        goalsTableView.register(GoalTableViewCell.self, forCellReuseIdentifier: "goalCell")
        goalsTableView.dataSource = vc
        goalsTableView.delegate = vc
    }
    
    func setEmptyStateContent() {
        emptyState.stateTitle.text = "You haven’t set any goal yet"
        emptyState.stateDesc.text = "Add a new goal by clicking the + button at the top right corner"
    }
}
