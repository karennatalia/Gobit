//
//  AddHabitViewController+Delegate.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension AddHabitViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 && indexPath.row == 1 {
            return 516
        }
        else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let vc = PickScheduleViewController()
            vc.delegate = self
            vc.selectedDay = selectedDay
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.section == 2 && indexPath.row == 0 {
            let cell = addHabitView!.tableViewForm.cellForRow(at: IndexPath(row: 1, section: 2)) as! TextGuidelinesTableViewCell
            cell.isHidden.toggle()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

extension AddHabitViewController: SchedulePickedDelegate {
    func updatePickedSchedule(selectedDay: [Int]) {
        print("update \(selectedDay)")
        self.selectedDay = selectedDay
        addHabitView?.tableViewForm.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
    }
}
