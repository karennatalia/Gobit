//
//  GuidelinesViewController.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 29/07/22.
//

import UIKit
import SwiftUI

class GuidelinesViewController: UIViewController {

    var guidelinesView: GuidelinesView?
    
    var guidelines = NSMutableAttributedString(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        generateHabitGuidelines()
        
        guidelinesView = GuidelinesView(vc: self)
        self.view = guidelinesView
    }

    func generateHabitGuidelines() {
        guidelines.append(NSAttributedString(string: "Goal Level System\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]))
        guidelines.append(NSAttributedString(string: "Level system will help you visualize the progress towards your goal or the consistency of your habit routine!\nHere are some of the leveling rules:\n\n"))
        guidelines.append(NSAttributedString(string: "1. Level\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Every goal will have a level with maximum level 3. By doing your habit based on schedule, you will get experience point that will help you level up when you reach the maximum exp for each level\nMaximum exp for each goal will be different based on the number of habits\n\n"))
        guidelines.append(NSAttributedString(string: "2. Experience & Streak\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Everytime you did a habit, you will get exp point and you will get even more point if you did  your habit consistently (streak)\nHere are the exp point rules:\n- If you have 10 or more streak, each habit will give you 5 exp\n- If you have 5 or more streak, each habit will give you 3 exp\n- If you have streak below 5, each habit will give you 1 exp\n\n"))
        guidelines.append(NSAttributedString(string: "3. Health\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "In every level you will have 5 health. When you reach zero health then unfortunately your level will be descreased.\nHere are the health rules:\n- If you miss a habit, you health will be decreased by 1\n-For every 5 streak of a habit, you will get 1 health restored\n\n"))
        guidelines.append(NSAttributedString(string: "4. Level Calculation\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        guidelines.append(NSAttributedString(string: "Everyday when the day change at midnight, the level will be calculated based on your habit progress that day"))
        
    }
}
