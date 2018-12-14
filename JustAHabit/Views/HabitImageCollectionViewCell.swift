//
//  HabitImageCollectionViewCell.swift
//  JustAHabit
//
//  Created by Jaeson Booker on 12/4/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit

class HabitImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "habit image cell"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    func setImage(image: UIImage){
        self.habitImage.image = image
    }

    @IBOutlet weak var habitImage: UIImageView!

}
