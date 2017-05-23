//
//  CreateTaskViewController.swift
//  Freaking657
//
//  Created by Tom Munhoven on 22/05/2017.
//  Copyright © 2017 Tom Munhoven. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    // Link back to previous VC is obsolete in core data paradigm.
    // var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        // Create a task from the outlet information
        
        // Create pointer to AppDelegate context to access Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Use context pointer to access tasks
        let task = Task(context: context)
        
        // These two lines of source code are fine
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        // To save to core data, use a function embedded in AppDelegate. This does some error handling out of the box.
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Add new task to array in previous VC
        
        // The next two lines of code are obsolete in core data paradigm.
        // previousVC.tasks.append(task)
        // previousVC.tableView.reloadData()
        
        // This line calls the Navigation Controller to switch back to the main task view
        navigationController?.popViewController(animated: true)
        
    }
    
}
