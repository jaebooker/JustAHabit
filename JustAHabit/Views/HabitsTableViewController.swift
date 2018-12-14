//
//  MainViewController.swift
//  JustAHabit
//
//  Created by Jaeson Booker on 11/15/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    private var persistence = PersistenceLayer()
    var names: [String] = ["Moony", "Wormtail", "Padfoot", "Prongs"]
    var habits: [Habit] = [
        Habit(title: "Smoking", image: Habit.Images.book),
        Habit(title: "Drinking", image: Habit.Images.book),
        Habit(title: "Running over pedestrians", image: Habit.Images.book),
        Habit(title: "Eating dust", image: Habit.Images.book)
    ]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.habits.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
        let habit = persistence.habits[indexPath.row]
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        persistence.setNeedsToReloadHabits()
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedHabit = persistence.habits[indexPath.row]
        let habitDetailedVc = HabitDetailedViewController.instantiate()
        habitDetailedVc.habit = selectedHabit
        habitDetailedVc.habitIndex = indexPath.row
        navigationController?.pushViewController(habitDetailedVc, animated: true)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let habitToDelete = persistence.habits[indexPath.row]
            let habitIndexToDelete = indexPath.row
            
            let deleteAlert = UIAlertController(habitTitle: habitToDelete.title) {
                //self.persistence.delete(habitIndexToDelete)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            self.present(deleteAlert, animated: true)
        default:
            break
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        persistence.swapHabits(habitIndex: sourceIndexPath.row, destinationIndex: destinationIndexPath.row)
    }
}
extension HabitsTableViewController {
    func setupNavBar() {
        title = "JustAHabit"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = self.editButtonItem
    }
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
        let addHabitVc = AddHabitViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: addHabitVc)
        present(navigationController, animated: true, completion: nil)
//        names.insert("Yo, Planet, What's Up?", at: 0)
//        let topIndexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [topIndexPath], with: .automatic)
    }
}
extension UIAlertController {
    convenience init(habitTitle: String, comfirmHandler: @escaping () -> Void) {
        self.init(title: "Delete Habit", message: "Are you sure you want to delete \(habitTitle)?", preferredStyle: .actionSheet)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { _ in
            comfirmHandler()
        }
        self.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        self.addAction(cancelAction)
    }
}
