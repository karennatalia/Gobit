//
//  HabitDetailViewController+DataSource.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension HabitDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
//        case 2:
//            return 4
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "SCHEDULE"
        case 1:
            return "PROGRESS"
//        case 2:
//            return "HISTORY TRACKER"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! ScheduleTableViewCell
            cell.selectionStyle = .none
            
            let schedule = binaryToArray(scheduleData: selectedHabit?.schedule)
            if schedule[0] == 1 {
                cell.sunday.setGreenCircle(width: 34)
            }
            else {
                cell.sunday.setOutlineCircle(width: 34)
            }
            if schedule[1] == 1 {
                cell.monday.setGreenCircle(width: 34)
            }
            else {
                cell.monday.setOutlineCircle(width: 34)
            }
            if schedule[2] == 1 {
                cell.tuesday.setGreenCircle(width: 34)
            }
            else {
                cell.tuesday.setOutlineCircle(width: 34)
            }
            if schedule[3] == 1 {
                cell.wednesday.setGreenCircle(width: 34)
            }
            else {
                cell.wednesday.setOutlineCircle(width: 34)
            }
            if schedule[4] == 1 {
                cell.thursday.setGreenCircle(width: 34)
            }
            else {
                cell.thursday.setOutlineCircle(width: 34)
            }
            if schedule[5] == 1 {
                cell.friday.setGreenCircle(width: 34)
            }
            else {
                cell.friday.setOutlineCircle(width: 34)
            }
            if schedule[6] == 1 {
                cell.saturday.setGreenCircle(width: 34)
            }
            else {
                cell.saturday.setOutlineCircle(width: 34)
            }
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as! ProgressTableViewCell
            cell.selectionStyle = .none
            cell.doneNumber.text = "\(selectedHabit?.numOfDone ?? 0)"
            cell.missedNumber.text = "\(selectedHabit?.numOfMissed ?? 0)"
            
            if (selectedHabit?.numOfDone ?? 0) == 0 && (selectedHabit?.numOfMissed ?? 0) == 0 {
                cell.consistentNumber.text = "N/A"
            }
            else {
                let consistency = ((selectedHabit?.numOfDone ?? 0) * 100) / ((selectedHabit?.numOfDone ?? 0) + (selectedHabit?.numOfMissed ?? 0))
                cell.consistentNumber.text = "\(consistency)%"
            }
            return cell
//        case 2:
//            if indexPath.row == 0 {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell1", for: indexPath) as! CalendarTableViewCellOne
//                cell.selectionStyle = .none
//                return cell
//            }
//            else if indexPath.row == 1 {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell2", for: indexPath) as! CalendarTableViewCellTwo
//                cell.selectionStyle = .none
//                return cell
//            }
//            else if indexPath.row == 2 {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell3", for: indexPath) as! CalendarTableViewCellThree
//                cell.selectionStyle = .none
//                cell.dateCollection.dataSource = self
//                cell.dateCollection.delegate = self
//                return cell
//            }
//            else if indexPath.row == 3 {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell4", for: indexPath) as! CalendarTableViewCellFour
//                return cell
//            }
//            else {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell4", for: indexPath) as! CalendarTableViewCellFour
//                return cell
//            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell1", for: indexPath) as! CalendarTableViewCellOne
            return cell
        }
    }
}

extension HabitDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCollectionViewCell
        
        cell.dateLabel.text = "20"
        if indexPath.row == 0 {
            cell.backgroundColor = .blue
        }
        
        return cell
    }
}
