//
//  MainViewController.swift
//  JustAHabit
//
//  Created by Jaeson Booker on 11/15/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    
    var names: [String] = ["Moony", "Wormtail", "Padfoot", "Prongs"]
    var habits: [Habit] = [
        Habit(title: "Smoking", image: Habit.Images.book),
        Habit(title: "Drinking", image: Habit.Images.book),
        Habit(title: "Running over pedestrians", image: Habit.Images.book),
        Habit(title: "Eating dust", image: Habit.Images.book)
    ]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
        return habits.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
        let habit = habits[indexPath.row]
        cell.configure(habit)
        return cell
    }
//        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
//            cell = dequeueCell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        }
//        let name = names[indexPath.row]
//        cell.textLabel?.text = name
//        let habit = habits[indexPath.row]
//        cell.textLabel?.text = habit.title
//        return cell
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.register(
        HabitTableViewCell.nib,
        forCellReuseIdentifier: HabitTableViewCell.identifier
        )
    }
}
extension HabitsTableViewController {
    func setupNavBar() {
        title = "JustAHabit"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
    }
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
        names.insert("Yo, Planet, What's Up?", at: 0)
        let topIndexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [topIndexPath], with: .automatic)
    }
}
