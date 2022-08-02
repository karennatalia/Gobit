//
//  HomeViewController+DataSource.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todayHabitList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoTableViewCell
        let habit = todayHabitList![indexPath.row]
        
        cell.title.text = habit.title
        
        cell.doneButton.changeButtonStatus(status: habit.statusToday)
        cell.didHabitTapped = {
            habit.statusToday.toggle()
            self.habitRepo.updateStatus(item: habit, statusToday: habit.statusToday)
            self.homeView?.toDoTable.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
    }
}
