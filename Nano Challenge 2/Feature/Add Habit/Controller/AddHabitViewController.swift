//
//  AddHabitViewController.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

class AddHabitViewController: UIViewController {

    var addHabitView: AddHabitView?
    var selectedGoal: Goal?
    var selectedDay = [0, 0, 0, 0, 0, 0, 0]
    var isEdit: Bool?
    var selectedHabit: Habit?
    let guidelines = NSMutableAttributedString(string: "")
    
    let habitRepo = HabitRepository.shared
    
    var delegateVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        generateHabitGuidelines()
        
        addHabitView = AddHabitView(vc: self, goal: selectedGoal!, isEdit: isEdit!, delegateVC: delegateVC!)
        self.view = addHabitView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func generateHabitGuidelines() {
        guidelines.append(NSAttributedString(string: "Habit System\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]))
        guidelines.append(NSAttributedString(string: "Repeatable habit/routine that will lead you towards your goal. Here are some guiding questions to help you write your habit:\n\n"))
        guidelines.append(NSAttributedString(string: "1. What habit do I need to reach my goal?\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Example: writing, exercise, research, etc\n\n"))
        guidelines.append(NSAttributedString(string: "2. Why you need to do this habit?\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Think about the reason why this habit is important in order to reach your goal.\n\n"))
        guidelines.append(NSAttributedString(string: "3. When do I want to do this habit?\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Try to think of a specific time. Example: Right after work, before lunch, etc\n\n"))
        guidelines.append(NSAttributedString(string: "4. What do I need to prepare in advance?\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Things you need to prepare to get the best environment to do the habit.\nExample: \n- Have a clear idea about what to write\n- Prepare clothes in the backpack, etc.\n\n"))
        guidelines.append(NSAttributedString(string: "5. Can I keep doing it daily/based on you setted schedule?\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Consider if you are really capable of following this habit. If yes, continue and if not, try to iterate it and make the habit smaller & specific. \nExample: \n- Writing 1 paragraph a day\n- Exercise for 15 minutes"))
        
    }

}
