//
//  HabitTableViewCell.swift
//  JustAHabit
//
//  Created by Jaeson Booker on 11/19/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    static let identifier = "habit cell"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    @IBOutlet weak var labelStreaks: UILabel!
    @IBOutlet weak var labelHabitTitle: UILabel!
    @IBOutlet weak var imageViewIcon: UIImageView!
    
    func configure(_ habit: Habit) {
        self.imageViewIcon.image = habit.selectedImage.image
        self.labelHabitTitle.text = habit.title
        self.labelStreaks.text = "streak: \(habit.currentStreak)"
        
        if habit.hasCompletedForToday {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .disclosureIndicator
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
