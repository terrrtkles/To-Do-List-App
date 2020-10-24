//
//  Task.swift
//  ToDoApp
//
//  Created by Teresa Cheung on 5/11/20.
//  Copyright © 2020 Teresa Cheung. All rights reserved.
//

import Foundation

struct Keys {
    static let name = "name"
    static let isDone = "isDone"
    static let locationStreet = "locationStreet"
    static let locationCity = "locationCity"
}

//class Task: NSObject, NSCoding {
class Task {
    var todo: String?
    //add date, location
    var isDone: Bool?
    var locationStreet: String?
    var locationCity: String?
    var date: String?
    var priceInYen: String?
    var priceInDollar:String?
    
    init(name: String = "", isDone: Bool = false, locationStreet: String = "", locationCity: String = "", date: String = "", priceInDollar: String = "", priceInYen: String = "") {
        
        self.todo = name
        self.isDone = isDone
        self.locationStreet = locationStreet
        self.locationCity = locationCity
        self.date = date
        self.priceInDollar = priceInDollar
        self.priceInYen = priceInYen
    }
    /*
    func encode(with aCoder:NSCoder) {
        
        aCoder.encode(name, forKey: Keys.name)
        aCoder.encode(isDone, forKey: Keys.isDone)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObject(forKey: Keys.name) as? String else {return nil}
        
        guard let isDone = aDecoder.decodeObject(forKey: Keys.isDone) as? Bool else { return nil }
        
        self.init(name: name, isDone: isDone)
    }*/
}
