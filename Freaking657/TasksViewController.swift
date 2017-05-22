//
//  TasksViewController.swift
//  Freaking657
//
//  Created by Tom Munhoven on 21/05/2017.
//  Copyright © 2017 Tom Munhoven. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important { // not necessary to add "== true" as task.important is a boolean already.
            
            cell.textLabel?.text = "❗️\(task.name)"
            
        } else {
            
            cell.textLabel?.text = task.name
            
        }
        
        return cell
        
    }
    
    func makeTasks() -> [Task] {
        
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Cut the grass"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Buy new Mac"
        task3.important = true
        
        return [task1, task2, task3]
        
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
        
    }
    
}
