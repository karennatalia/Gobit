//
//  GoalDetailViewController.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import UIKit

class GoalDetailViewController: UIViewController {
    
    var goalDetailView: GoalDetailView?
    lazy var editBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
    
    var selectedGoal: Goal?
    
    let habitRepo = HabitRepository.shared
    var habitList: [Habit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Goal"
        navigationItem.rightBarButtonItem = editBarButton
        navigationController?.navigationBar.tintColor = UIColor.primGreen
        
    }
    
    override func loadView() {
        habitList = selectedGoal?.habits?.allObjects as! [Habit]
        
        goalDetailView = GoalDetailView(vc: self, goal: selectedGoal!)
        self.view = goalDetailView
    }
    
    @objc func editAction() {
        let addGoalVC = AddGoalViewController()
        addGoalVC.isEdit = true
        addGoalVC.delegateVC = self
        addGoalVC.selectedGoal = selectedGoal
        present(addGoalVC, animated: true)
    }
}
