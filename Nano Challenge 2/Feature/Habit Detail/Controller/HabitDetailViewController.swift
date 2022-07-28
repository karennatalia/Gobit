//
//  HabitDetailViewController.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class HabitDetailViewController: UIViewController {

    lazy var editBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
    
    var habitDetailView: HabitDetailView?
    var selectedHabit: Habit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Habit System"
        navigationItem.rightBarButtonItem = editBarButton
        navigationController?.navigationBar.tintColor = UIColor.primGreen
    }
    
    override func loadView() {
        habitDetailView = HabitDetailView(vc: self, habit: selectedHabit!)
        self.view = habitDetailView
    }
    
    @objc func editAction() {
        let addHabitVC = AddHabitViewController()
        addHabitVC.isEdit = true
        addHabitVC.selectedHabit = selectedHabit
        addHabitVC.selectedGoal = selectedHabit?.goal
        addHabitVC.selectedDay = binaryToArray(scheduleData: selectedHabit?.schedule)
        addHabitVC.delegateVC = self
        
        let nav = UINavigationController(rootViewController: addHabitVC)
        present(nav, animated: true)
    }
}
