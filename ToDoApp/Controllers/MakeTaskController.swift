//
//  MakeTaskController.swift
//  ToDoApp
//
//  Created by Teresa Cheung on 5/14/20.
//  Copyright © 2020 Teresa Cheung. All rights reserved.
//

import UIKit

class MakeTaskController: UITableViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ListViewController
        {
            let vc = segue.destination as? ListViewController
            //vc?.addToList(todo: "Testing")
        }
    }
    
    var listViewController: ListViewController?
    var delegate:TaskDelegate?
    
    //When done button is clicked, send data to prev view
    @IBAction func AddTask(_ sender: UIBarButtonItem) {
        
        //grab info and send back
        let task: Task = getTaskData()
        
        delegate?.onTaskDone(type: task)
        
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var ThingFirst: UITextField!
    @IBOutlet weak var yenCost: UITextField!
    @IBOutlet weak var dollarCost: UITextField!
    @IBOutlet weak var locationStreet: UITextField!
    @IBOutlet weak var locationCity: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    private func getTaskData() -> Task {
        
        let _thingFirst:String = ThingFirst.text!
        let _yen:String = yenCost.text!
        let _dollar:String = dollarCost.text!
        let _street:String = locationStreet.text!
        let _city:String = locationCity.text!
        let _date:String = "Will fix date type"
        
        let task = Task(name:_thingFirst, isDone:false, locationStreet:_street, locationCity:_city, date:_date, priceInDollar:_dollar, priceInYen:_yen)
        
        return task
    }
}
