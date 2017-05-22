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
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        // Create a task from the outlet information
        
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        // Add new task to array in previous VC
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
    }
    
}
