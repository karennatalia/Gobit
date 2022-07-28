//
//  GoalsViewController+DataSource.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

extension GoalsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        dummyGoals.count
        return goalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as! GoalTableViewCell
        
        let level = goalList[indexPath.row].level
        if level == 1 {
            cell.goalImage.image = UIImage(named: "level-one")
        }
        else if level == 2 {
            cell.goalImage.image = UIImage(named: "level-two")
        }
        else if level == 3 {
            cell.goalImage.image = UIImage(named: "level-three")
        }
        cell.goalTitle.text = goalList[indexPath.row].title
        cell.goalDate.text = "Started \(dateToString(date: goalList[indexPath.row].startDate ?? Date()))"
        
        return cell
    }
}
