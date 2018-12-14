//
//  HabitDetailedViewController.swift
//  JustAHabit
//
//  Created by Jaeson Booker on 12/13/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

class HabitDetailedViewController: UIViewController {
    var habit: Habit?
    var habitIndex: Int?
    private var persistence = PersistenceLayer()
    @IBAction func pressActionButton(_ sender: Any) {
        habit = persistence.markHabitAsCompleted(habitIndex!)
        updateUI()
    }
    @IBOutlet weak var imageViewIcon: UIImageView!
    
    @IBOutlet weak var labelCurrentStreak: UILabel!
    @IBOutlet weak var labelTotalCompletions: UILabel!
    @IBOutlet weak var labelBestStreak: UILabel!
    @IBOutlet weak var labelStartingDate: UILabel!
    @IBOutlet weak var buttonAction: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func updateUI() {
        // Group 1
        title = habit!.title
        imageViewIcon.image = habit!.selectedImage.image
        labelCurrentStreak.text = "\(habit!.currentStreak) days"
        labelTotalCompletions.text = String(habit!.numberOfCompletions)
        labelBestStreak.text = String(habit!.bestStreak)
        labelStartingDate.text = habit!.dateCreated.stringValue
        
        // Group 2
        if (habit?.hasCompletedForToday)! {
            buttonAction.setTitle("Completed for Today!", for: .normal)
        } else {
            buttonAction.setTitle("Mark as Completed", for: .normal)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
