//
//  CategoryViewController.swift
//  ToDoApp
//
//  Created by Teresa Cheung on 5/12/20.
//  Copyright © 2020 Teresa Cheung. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController {
    
    let categories = ["Sightseeing", "Food", "Shopping", "Transportation", "Lodging"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cate", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func SelectCategory(_ sender: UIBarButtonItem) {
        
        //grab info and send back
        
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func CancelCategory(_ sender: UIBarButtonItem) {
        
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
