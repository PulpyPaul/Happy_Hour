//
//  ReviewData.swift
//  Happy_Hour
//
//  Created by Student on 4/19/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

// ------------- Imports ---------------
import Foundation

// Singleton used to hold review data
class ReviewData {
    
    // Instance of singleton
    static let sharedData = ReviewData()
    
    // Holds lists of reviews
    var reviews = [Review]()
    
    // Private init to avoid instantiation
    private init() { }
}
