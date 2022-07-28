//
//  PickScheduleViewController.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import UIKit

protocol SchedulePickedDelegate {
    func updatePickedSchedule(selectedDay: [Int])
}

class PickScheduleViewController: UIViewController {

    var pickScheduleView: PickScheduleView?
    var selectedDay = [0, 0, 0, 0, 0, 0, 0]
    
    var delegate: SchedulePickedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        pickScheduleView = PickScheduleView(vc: self)
        self.view = pickScheduleView
        navigationItem.title = "Schedule"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .primGreen
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.updatePickedSchedule(selectedDay: selectedDay)
    }

}
