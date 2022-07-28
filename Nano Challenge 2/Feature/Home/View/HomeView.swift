//
//  HomeView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 25/07/22.
//

import UIKit

class HomeView: UIView {
    
    private lazy var scrollView = UIScrollView()
    private lazy var contentView: UIStackView = createStackViewVertical()
    private lazy var titleLbl: UILabel = createBlackSemiboldLabel(text: "To Do", size: 20, alignment: .left)
    lazy var toDoTable: UITableView = createTableView(isScrollable: false)
    private lazy var quotesLbl: UILabel = createGreyRegularLabel(text: "Great things never come from comfort zone", size: 14, alignment: .center)
    private lazy var quotesWriterLbl: UILabel = createGreyRegularLabel(text: "~Ben Francia~", size: 14, alignment: .center)
    private lazy var emptyState = EmptyState()
    
    let vc: HomeViewController?
    
    required init(vc: HomeViewController) {
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
        self.addSubview(titleLbl)
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addArrangedSubview(toDoTable)
        self.addSubview(emptyState)
        contentView.addArrangedSubview(quotesLbl)
        contentView.addArrangedSubview(quotesWriterLbl)
    }
    
    func setupConstraint() {
        titleLbl.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, paddingTop: 16, paddingLeft: 16, height: 32)
        scrollView.anchor(top: titleLbl.bottomAnchor, left: self.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.rightAnchor)
        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor)
        
        toDoTable.anchor(top: contentView.topAnchor, left: self.leftAnchor, right: self.rightAnchor, height: CGFloat(81 * (vc?.todayHabitList!.count ?? 0)))
        
        updateEmptyStateConstraint()
        quotesWriterLbl.anchor(top: quotesLbl.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingRight: 16)
        
    }
    
    func updateEmptyStateConstraint() {
        if vc?.todayHabitList!.count == 0 {
            emptyState.isHidden = false
            emptyState.centerX(inView: self)
            emptyState.centerY(inView: self)
            setEmptyStateContent()
            emptyState.setDimensions(width: UIScreen.main.bounds.width - 32, height: 200)
            quotesLbl.anchor(top: emptyState.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        }
        else {
            emptyState.isHidden = true
            quotesLbl.anchor(top: toDoTable.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        }
    }
    
    func setEmptyStateContent() {
        emptyState.stateTitle.text = "There’s nothing to do yet :("
        emptyState.stateDesc.text = "Start by adding a new goal or schedule a habit to do today"
    }
    
    func updateTableViewConstraint() {
        toDoTable.anchor(top: titleLbl.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, height: CGFloat(81 * (vc?.todayHabitList!.count ?? 0)))
    }
    
    func setupTableView() {
        toDoTable.register(ToDoTableViewCell.self, forCellReuseIdentifier: "toDoCell")
        toDoTable.dataSource = vc
        toDoTable.delegate = vc
    }
}
