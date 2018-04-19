//
//  ReviewData.swift
//  Happy_Hour
//
//  Created by Student on 4/19/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import Foundation

protocol ReviewData {
    
    var reviewData: [Any] {get set}
    
    func save()
    func load()
}

class AppDataUserDefaults: ReviewData {
    
    // ivars
    let defaults: UserDefaults
    
    var reviewData: [Any]
    
    // initializer
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        defaults = userDefaults
        
        reviewData = ["Should change after intialization"]
        
        //https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift/30548130
        if let path = Bundle.main.path(forResource: "reviews", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["reviews"] as? [Any] {
                    reviewData = person
                }
            } catch {
                print("Error loading JSON Data")
                reviewData = ["No data found!"]
            }
        }
    }

    // functions
    func save() {
        
    }
    
    func load() {
        
    }
}

