//
//  TaskViewController.swift
//  ToDoApp
//
//  Created by Teresa Cheung on 5/12/20.
//  Copyright © 2020 Teresa Cheung. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    
    var taskText:String = ""
    var locationStreet:String = ""
    var locationCity:String = ""
    var priceInYen:String = ""
    var priceInDollar:String = ""
    var date:String = ""
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var locationStreetLabel: UILabel!
    @IBOutlet weak var locationCityLabel: UILabel!
    @IBOutlet weak var priceInYenLabel: UILabel!
    @IBOutlet weak var priceInDollarLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskLabel?.text = taskText
        locationCityLabel?.text = locationCity
        locationStreetLabel?.text = locationStreet
        priceInYenLabel?.text = priceInYen
        priceInDollarLabel?.text = priceInDollar
        dateLabel?.text = date
        
        self.viewDidLoad()
        self.viewWillAppear(true)
    }
    
}
