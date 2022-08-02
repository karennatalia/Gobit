//
//  AddHabitView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

protocol HabitAddedDelegate {
    func updateHabit()
}

protocol AddHabitDelegate {
    func cancelAdd()
    func validateForms(title: String, desc: String, schedule: String)
}

class AddHabitView: UIView {
    
    private lazy var navBar = CustomNavBar(leftButtonActive: true, rightButtonActive: true, leftText: "Cancel", righText: "Done")
    private lazy var navTitle: UILabel = CustomLabel(text: "New Habit", style: FontStyle.systemDefaultBold, alignment: .center, color: .black)
    lazy var tableViewForm: UITableView = CustomTableView(isScrollable: false, style: .insetGrouped)
    
    var habitAddedDelegate: HabitAddedDelegate?
    var addHabitDelegate: AddHabitDelegate?
    
    let vc: AddHabitViewController?
    let goal: Goal?
    
    required init(vc: AddHabitViewController, goal: Goal, isEdit: Bool, delegateVC: UIViewController) {
        self.vc = vc
        self.goal = goal
        self.addHabitDelegate = vc
        super.init(frame: .zero)
        
        setupUI()
        setupConstraint()
        setupTableView()
        
        if isEdit == true {
            self.habitAddedDelegate = delegateVC as! HabitDetailViewController
            setupEditMode()
        }
        else {
            self.habitAddedDelegate = delegateVC as! GoalDetailViewController
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
//        tableViewForm.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    func setupTableView() {
        tableViewForm.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "habitTitleCell")
        tableViewForm.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "habitDescCell")
        tableViewForm.register(PickScheduleTableViewCell.self, forCellReuseIdentifier: "pickScheduleCell")
        tableViewForm.register(GuidelinesTableViewCell.self, forCellReuseIdentifier: "habitGuideTextCell")
        tableViewForm.register(TextGuidelinesTableViewCell.self, forCellReuseIdentifier: "habitGuideCell")
        tableViewForm.delegate = vc
        tableViewForm.dataSource = vc
    }
    
    func setupEditMode() {
        navTitle.text = "Edit Habit"
    }
    
    @objc func cancelAction() {
        addHabitDelegate?.cancelAdd()
    }
    
    @objc func doneAction() {
        let title = (tableViewForm.cellForRow(at: IndexPath(row: 0, section: 0)) as! TextFieldTableViewCell).textField.text
        let desc = (tableViewForm.cellForRow(at: IndexPath(row: 1, section: 0)) as! TextFieldTableViewCell).textField.text
        let schedule = (tableViewForm.cellForRow(at: IndexPath(row: 0, section: 1)) as! PickScheduleTableViewCell).pickedDayLabel.text
        
        addHabitDelegate?.validateForms(title: title!, desc: desc!, schedule: schedule!)
    }
    
//    @objc func hideKeyboard() {
//        self.endEditing(true)
//    }
    
}
