//
//  ListViewController.swift
//  ToDoApp
//
//  Created by Teresa Cheung on 5/11/20.
//  Copyright © 2020 Teresa Cheung. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, TaskDelegate {
    
    let listTypes = ["To-Do List", "Completed List", "Abandoned List"]
    
    var taskStore: TaskStore! {
        didSet {
            //get data
            taskStore.tasksSections = TasksUtility.fetch() ?? [[Task](), [Task](), [Task]()]
            
            //reload table view
            tableView.reloadData()
        }
    }
    
    
    func onTaskDone(type: Task) {
        print("HUHUHU \(type)")
        
        addToList(name:type.todo!, isDone: type.isDone!,locationStreet: type.locationStreet!, locationCity: type.locationCity!, date: type.date!, priceInDollar: type.priceInDollar!, priceInYen: type.priceInYen!)
    }
    
    var test:String = ""
    
    @IBAction func adddummyrask(_ sender: UIBarButtonItem) {
        
        //addToList(todo: "button click")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.tableFooterView = UIView()
    }
    
    /*func addToList(todo:String) {
        
        
        //create task
        //fix with other arguments
        let newTask = Task(name:todo)
        
        //add task
        self.taskStore.add(newTask, at: 0)
        
        //reload table view
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        //TasksUtility.save(self.taskStore.tasksSections)
    }*/
    
    func addToList(name: String, isDone: Bool = false, locationStreet: String, locationCity: String, date: String, priceInDollar: String, priceInYen: String) {
        
        
        //create task
        //fix with other arguments
        let newTask = Task(name:name, isDone: isDone,locationStreet: locationStreet, locationCity: locationCity, date: date, priceInDollar: priceInDollar, priceInYen: priceInYen)
        
        //add task
        self.taskStore.add(newTask, at: 0)
        
        //reload table view
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        //TasksUtility.save(self.taskStore.tasksSections)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is TaskViewController
        {
            let vc = segue.destination as? TaskViewController
            vc?.taskText = taskToPass.todo ?? "Cannot read task"
            vc?.locationStreet = taskToPass.locationStreet ?? "No street provided"
            vc?.locationCity = taskToPass.locationCity ?? "No street provided"
            vc?.date = taskToPass.date ?? "HMM date?"
            vc?.priceInYen = taskToPass.priceInYen ?? "No price in yen"
            vc?.priceInDollar = taskToPass.priceInDollar ?? "No price in dollar"
            
        }
        
        if let destination = segue.destination as? MakeTaskController {
            destination.delegate = self
        }
    }
    var taskToPass: Task!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        taskToPass = taskStore.tasksSections[indexPath.section][indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskViewTableCell
        
        cell.taskLabel.text = taskStore.tasksSections[indexPath.section][indexPath.row].todo
        
        
        return cell
    }
    
}

//MARK: - DataSource

extension ListViewController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listTypes[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return taskStore.tasksSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasksSections[section].count
    }
    
}

extension ListViewController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 50
       }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, sourceView, completionHandler) in
            
            //check if task is done
            guard let isDone = self.taskStore.tasksSections[indexPath.section][indexPath.row].isDone else { return }
            
            //remove task from array
            self.taskStore.removeTask(at: indexPath.row, isDone: isDone)
            
            //reload table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //TasksUtility.save(self.taskStore.tasksSections)
            //indicate action was performed
            completionHandler(true)
        }
        deleteAction.image = #imageLiteral(resourceName: "delete")
        deleteAction.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneAction = UIContextualAction(style: .normal, title: nil) { (action, sourceView, completionHandler) in
            
            //toggle done
            self.taskStore.tasksSections[0][indexPath.row].isDone = true
            
            //remove from to do array
            let doneTask = self.taskStore.removeTask(at: indexPath.row)
            
            //reload table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            //add to done array
            self.taskStore.add(doneTask, at: 0, isDone: true)
            
            //reload table view
            tableView.insertRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
            //TasksUtility.save(self.taskStore.tasksSections)
            //indicate action was done
            completionHandler(true)
        }
        
        doneAction.image = #imageLiteral(resourceName: "done")
        doneAction.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [doneAction]) : nil
    }
}
