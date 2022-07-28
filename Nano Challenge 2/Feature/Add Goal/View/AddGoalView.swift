//
//  AddGoalView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class AddGoalView: UIView {

    private lazy var navBar = NavBar()
    private lazy var navTitle: UILabel = createBlackSemiboldLabel(text: "New Goal", size: 17, alignment: .center)
    lazy var tableViewForm: UITableView = createInsetGroupedTableView(isScrollable: false)
    
    private var addGoalDelegate: AddGoalDelegate?
    var goalAddedDelegate: GoalAddedDelegate?
    
    let vc: AddGoalViewController?
    
    required init(vc: AddGoalViewController, delegateVC: UIViewController, isEdit: Bool) {
        self.vc = vc
        super.init(frame: .zero)
        
        self.addGoalDelegate = vc
        
        setupUI()
        setupConstraint()
        setupTableView()
        
        if isEdit == false {
            self.goalAddedDelegate = delegateVC as! GoalsViewController
        }
        else {
            self.goalAddedDelegate = delegateVC as! GoalDetailViewController
            setupEditMode()
        }
        
        navBar.leftButton?.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        navBar.rightButton?.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = UIColor.bgColor
        self.addSubview(navBar)
        navBar.addSubview(navTitle)
        self.addSubview(tableViewForm)
    }
    
    func setupConstraint() {
        navBar.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, height: 62)
        navTitle.centerX(inView: navBar)
        navTitle.centerY(inView: navBar)
        
        tableViewForm.anchor(top: navBar.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor)
    }
    
    func setupTableView() {
        tableViewForm.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "goalTitleCell")
        tableViewForm.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "goalDescCell")
        tableViewForm.register(TextViewTableViewCell.self, forCellReuseIdentifier: "whyCell")
        tableViewForm.register(GuidelinesTableViewCell.self, forCellReuseIdentifier: "goalGuideTextCell")
        tableViewForm.register(TextGuidelinesTableViewCell.self, forCellReuseIdentifier: "goalGuideCell")
        tableViewForm.delegate = vc
        tableViewForm.dataSource = vc
    }
    
    func setupEditMode() {
        navTitle.text = "Edit Goal"
    }
    
    @objc func cancelAction() {
        vc?.cancelConfirmationAlert()
    }
    
    @objc func doneAction() {
        addGoalDelegate?.validateField()
        goalAddedDelegate?.reloadGoals()
    }
}
