//
//  GoalsViewController.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 25/07/22.
//

import UIKit

class GoalsViewController: UIViewController {

    var goalsView:GoalsView?
    lazy var plusBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toAddGoal))
    
    let goalRepo = GoalRepository.shared
    var goalList: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = plusBarButton
        tabBarController?.tabBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .primGreen
    }
    
    override func loadView() {
        goalList = goalRepo.showAll()
        
        goalsView = GoalsView(vc: self)
        self.view = goalsView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        goalList = goalRepo.showAll()
        goalsView?.goalsTableView.reloadData()
    }
    
    @objc func toAddGoal() {
        let vc = AddGoalViewController()
        vc.delegateVC = self
        vc.isEdit = false
        present(vc, animated: true)
    }
}
