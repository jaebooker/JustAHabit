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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = dequeueCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let name = names[indexPath.row]
        cell.textLabel?.text = name
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
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
