//
//  AddGoalViewController.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import UIKit

class AddGoalViewController: UIViewController {
    
    var addGoalView: AddGoalView?
    var goalTitle: String?
    var goalDesc: String?
    var goalWhy: String?
    let guidelines = NSMutableAttributedString(string: "")
    
    let goalRepo = GoalRepository.shared
    
    var delegateVC: UIViewController?
    var isEdit: Bool?
    var selectedGoal: Goal?
    
    var textViewHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        generateGoalGuidelines()
        
        addGoalView = AddGoalView(vc: self, delegateVC: delegateVC!, isEdit: isEdit!)
        self.view = addGoalView
    }
    
    func generateGoalGuidelines() {
        guidelines.append(NSAttributedString(string: "Goals\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]))
        guidelines.append(NSAttributedString(string: "We use goal only as a direction and not as an end-goal so that it will lead us to continuous improvement of ourself!\n\n"))
        guidelines.append(NSAttributedString(string: "1. Goal Title\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Try to set a goal not based on what output you want to achieve but what identity you want to have. Ask yourself “What type of person do I want to be?”\n\nExample: - I want to be an excellent developer - I want to be a healthy person\n\n"))
        guidelines.append(NSAttributedString(string: "2. Strong \"Why\"\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Write down a strong reason/purpose about why you wnat to achieve this goal. This will help you to keep motivated anytime you feel down."))
        
    }
}
