//
//  AppController.swift
//  Happy_Hour
//
//  Created by Student on 4/19/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import Foundation

class AppController {
    
    // ivars
    private var dataModel: ReviewData
    
    var reviewData: [Any] {
        get {
            return dataModel.reviewData
        }
    }
    
    // initializer
    init(dataModel: ReviewData = AppDataUserDefaults()) {
        self.dataModel = dataModel
    }
}
