//
//  HabitDetailView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class HabitDetailView: UIView {

    private lazy var habitTitle: UILabel = createBlackSemiboldLabel(text: "Habit Title", size: 20, alignment: .left)
    private lazy var habitDesc: UITextView = createTextView()
    private lazy var contentTableView: UITableView = createTableView(isScrollable: true)
    
    let vc: HabitDetailViewController?
    let habit: Habit?
    
    required init(vc: HabitDetailViewController, habit: Habit) {
        self.vc = vc
        self.habit = habit
        super.init(frame: .zero)
        
        setupUI()
        setupConstraint()
        setupTableView()
        setupUIContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUIContent() {
        habitTitle.text = habit?.title
        if habit?.desc == "" {
            habitDesc.setHeight(height: 0)
        }
        else {
            habitDesc.sizeToFit()
            habitDesc.isScrollEnabled = false
            habitDesc.text = habit?.desc
        }
    }
    
    func setupUI() {
        self.addSubview(habitTitle)
        self.addSubview(habitDesc)
        self.addSubview(contentTableView)
        
        habitDesc.backgroundColor = .clear
        habitDesc.font = UIFont.systemFont(ofSize: 12)
    }
    
    func setupConstraint() {
        habitTitle.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        habitDesc.anchor(top: habitTitle.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingLeft: 16, paddingRight: 16)
        contentTableView.anchor(top: habitDesc.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 8)
    }
    
    func setupTableView() {
        contentTableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: "scheduleCell")
        contentTableView.register(ProgressTableViewCell.self, forCellReuseIdentifier: "progressCell")
//        contentTableView.register(CalendarTableViewCellOne.self, forCellReuseIdentifier: "calendarCell1")
//        contentTableView.register(CalendarTableViewCellTwo.self, forCellReuseIdentifier: "calendarCell2")
//        contentTableView.register(CalendarTableViewCellThree.self, forCellReuseIdentifier: "calendarCell3")
//        contentTableView.register(CalendarTableViewCellFour.self, forCellReuseIdentifier: "calendarCell4")
        contentTableView.dataSource = vc
        contentTableView.delegate = vc
    }

}
