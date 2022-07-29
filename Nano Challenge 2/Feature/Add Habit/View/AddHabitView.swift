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

class AddHabitView: UIView {
    
    private lazy var navBar = NavBar()
    private lazy var navTitle: UILabel = createBlackSemiboldLabel(text: "New Habit", size: 17, alignment: .center)
    lazy var tableViewForm: UITableView = createInsetGroupedTableView(isScrollable: false)
    
    private lazy var tempCancel: UIButton = createTextButton(text: "Test CANCEl")
    private lazy var tempDone: UIButton = createTextButton(text: "Done")
    
    var delegate: HabitAddedDelegate?
    
    let vc: AddHabitViewController?
    let goal: Goal?
    
    required init(vc: AddHabitViewController, goal: Goal, isEdit: Bool, delegateVC: UIViewController) {
        self.vc = vc
        self.goal = goal
        super.init(frame: .zero)
        
        setupUI()
        setupConstraint()
        setupTableView()
        
        if isEdit == true {
            self.delegate = delegateVC as! HabitDetailViewController
            setupEditMode()
        }
        else {
            self.delegate = delegateVC as! GoalDetailViewController
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
        tableViewForm.register(ToggleTableViewCell.self, forCellReuseIdentifier: "remindToggleCell")
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
        vc?.dismiss(animated: true)
    }
    
    @objc func doneAction() {
        let title = (tableViewForm.cellForRow(at: IndexPath(row: 0, section: 0)) as! TextFieldTableViewCell).textField.text
        let desc = (tableViewForm.cellForRow(at: IndexPath(row: 1, section: 0)) as! TextFieldTableViewCell).textField.text
        let schedule = (tableViewForm.cellForRow(at: IndexPath(row: 0, section: 1)) as! PickScheduleTableViewCell).pickedDayLabel.text
        if title == "" {
            vc?.contentAlert(title: "Habit Title is Empty", message: "Please fill out the habit title")
        }
        else if schedule == "" {
            vc?.contentAlert(title: "No Schedule Picked", message: "Please pick minimum one day to do the habit")
        }
        else {
            if vc?.isEdit == false {
                vc?.habitRepo.add(title: title ?? "", schedule: vc?.selectedDay ?? [], desc: desc ?? "", goal: vc?.selectedGoal ?? Goal())
            }
            else {
                vc?.habitRepo.update(item: vc?.selectedHabit ?? Habit(), newTitle: title ?? "", newDesc: desc ?? "", schedule: vc?.selectedDay ?? [])
            }
            delegate?.updateHabit()
            vc?.dismiss(animated: true)
        }
    }
    
//    @objc func hideKeyboard() {
//        self.endEditing(true)
//    }
    
}
