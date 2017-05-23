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
    // This variable is obsolete in the core data framwwork.
    // var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        getTasks()
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important { // not necessary to add "== true" as task.important is a boolean already.
            
            cell.textLabel?.text = "❗️\(task.name!)"
            
        } else {
            
            cell.textLabel?.text = task.name!
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // The selectIndex variable is obsolete in the core data framework.
        // selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
        
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    func getTasks() { // This function pulls out the data from core data and will be called whenever this VC is about to display on screen.
        
        // create link to context in core data.
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Use the fetch function within context to collect the task table. This function "throws" and must therefore go in a do-try-catch framework.
        
        do {
            
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
            
        } catch {
            
            print("Error collecting Tasks table.")
            
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /* This if loop is no longer required in the core data paradigm.
         
         if segue.identifier == "addSegue" {
         
         let nextVC = segue.destination as! CreateTaskViewController
         nextVC.previousVC = self
         
         }
         
         */
        
        if segue.identifier == "selectTaskSegue" {
            
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task // as! replaced by as?
            // In the core data framework, it is not necessary to link between view controllers.
            // nextVC.previousVC = self
            
        }
        
    }
    
}
