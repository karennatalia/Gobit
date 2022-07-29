//
//  AddGoalViewController+DataSource.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension AddGoalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        else {
            return 2
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "goalTitleCell", for: indexPath) as! TextFieldTableViewCell
                cell.textField.placeholder = "Goal Title"
                if isEdit == true {
                    cell.textField.text = selectedGoal?.title
                }
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "goalDescCell", for: indexPath) as! TextFieldTableViewCell
                cell.textField.placeholder = "Description (optional)"
                if isEdit == true {
                    cell.textField.text = selectedGoal?.desc
                }
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "whyCell", for: indexPath) as! TextViewTableViewCell
                cell.textView.text = "Write down a strong \"why\""
                cell.textView.textColor = UIColor.systemGray3
                cell.textView.delegate = self
                if isEdit == true {
                    cell.textView.text = selectedGoal?.why
                }
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "goalTitleCell", for: indexPath) as! TextFieldTableViewCell
                cell.textField.placeholder = "Goal Title"
                return cell
            }
        case 1:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "goalGuideTextCell", for: indexPath) as! GuidelinesTableViewCell
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "goalGuideCell", for: indexPath) as! TextGuidelinesTableViewCell
                cell.textView.attributedText = guidelines
                textViewHeight = cell.textView.contentSize.height
                cell.isHidden = true
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "guidelinesCell", for: indexPath) as! GuidelinesTableViewCell
                return cell
            }
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "guidelinesCell", for: indexPath) as! GuidelinesTableViewCell
            return cell
        }
        
        
    }
}
