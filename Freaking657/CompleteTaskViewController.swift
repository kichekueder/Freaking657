//
//  CompleteTaskViewController.swift
//  Freaking657
//
//  Created by Tom Munhoven on 22/05/2017.
//  Copyright © 2017 Tom Munhoven. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var previousVC = TasksViewController()
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if task.important { // not necessary to add "== true" as task.important is a boolean already.
            
            taskLabel.text = "❗️\(task.name)"
            
        } else {
            
            taskLabel.text = task.name
            
        }

        
    }

        @IBAction func completeTapped(_ sender: Any) {
            
            previousVC.tasks.remove(at: previousVC.selectedIndex)
            previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true)
            
    }
    
}
