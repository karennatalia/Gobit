//
//  AddHabitViewController+DataSource.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension AddHabitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else if section == 1 {
            return 1
        }
        else {
            return 2
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "habitTitleCell", for: indexPath) as! TextFieldTableViewCell
                cell.textField.placeholder = "Habit Title"
                if isEdit == true {
                    cell.textField.text = selectedHabit?.title
                }
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "habitDescCell", for: indexPath) as! TextFieldTableViewCell
                cell.textField.placeholder = "Description (optional)"
                if isEdit == true {
                    cell.textField.text = selectedHabit?.desc
                }
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "habitTitleCell", for: indexPath) as! TextFieldTableViewCell
                cell.textField.placeholder = "Habit Title"
                return cell
            }
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "pickScheduleCell", for: indexPath) as! PickScheduleTableViewCell
            cell.pickedDayLabel.text = pickedDayString(selectedDay: selectedDay)
            return cell
        }
        else {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "habitGuideTextCell", for: indexPath) as! GuidelinesTableViewCell
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "habitGuideCell", for: indexPath) as! TextGuidelinesTableViewCell
                cell.textView.attributedText = guidelines
                cell.isHidden = true
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "habitGuideTextCell", for: indexPath) as! GuidelinesTableViewCell
                return cell
            }
        }
    }
}
