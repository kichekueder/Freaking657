//
//  CompleteTaskViewController.swift
//  Freaking657
//
//  Created by Tom Munhoven on 22/05/2017.
//  Copyright © 2017 Tom Munhoven. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    // Using core data paradigm, this line of source code is obsolete.
    // var previousVC = TasksViewController()
    
    @IBOutlet weak var taskLabel: UILabel!
    
    // Prepare token task container of the type Task.
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if task!.important { // not necessary to add "== true" as task.important is a boolean already.
            
            taskLabel.text = "❗️\(task!.name!)"
            
        } else {
            
            taskLabel.text = task!.name!
            
        }

        
    }

        @IBAction func completeTapped(_ sender: Any) {
            
            // Using the core data paradigm, these two lines of source code are obsolete.
            // previousVC.tasks.remove(at: previousVC.selectedIndex)
            // previousVC.tableView.reloadData()
            
            // Provide link to core data context.
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            // Delete the task is core data
            context.delete(task!)
            
            // Refresh the core data database
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            // Return to main tasks VC, same as before.
            navigationController?.popViewController(animated: true)
            
    }
    
}
