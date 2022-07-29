//
//  AddGoalViewController+Delegate.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension AddGoalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0, 1:
                return 44
            case 2:
                return 200
            default:
                return 44
            }
        case 1:
            switch indexPath.row {
            case 0:
                return 44
            case 1:
                return 300
            default:
                return 44
            }
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            let cell = addGoalView!.tableViewForm.cellForRow(at: IndexPath(row: 1, section: 1)) as! TextGuidelinesTableViewCell
            cell.isHidden.toggle()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

extension AddGoalViewController: AddGoalDelegate {
    func validateField() {
        let title = (addGoalView!.tableViewForm.cellForRow(at: IndexPath(row: 0, section: 0)) as! TextFieldTableViewCell).textField.text
        let desc = (addGoalView!.tableViewForm.cellForRow(at: IndexPath(row: 1, section: 0)) as! TextFieldTableViewCell).textField.text
        let why = (addGoalView!.tableViewForm.cellForRow(at: IndexPath(row: 2, section: 0)) as! TextViewTableViewCell).textView.text
        if title == "" {
            contentAlert(title: "Goal Title is Empty", message: "Please fill out the goal title")
        }
        else if why == "Write down a strong \"why\"" || why == "" {
            contentAlert(title: "Strong \"why\" is Empty", message: "Please fill out why you want to achieve this goal")
        }
        else {
            if isEdit == false {
                goalRepo.add(title: title ?? "", desc: desc ?? "", why: why ?? "")
            }
            else {
                goalRepo.update(item: selectedGoal!, newTitle: title ?? "", newDesc: desc ?? "", newWhy: why ?? "")
            }
            dismiss(animated: true)
        }
    }
}

extension AddGoalViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.systemGray3 {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write down a strong \"why\""
            textView.textColor = UIColor.systemGray3
        }
    }
}
