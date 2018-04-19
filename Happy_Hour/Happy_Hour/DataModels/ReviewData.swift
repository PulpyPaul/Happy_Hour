//
//  ReviewData.swift
//  Happy_Hour
//
//  Created by Student on 4/19/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import Foundation

class ReviewData {
    
    static let sharedData = ReviewData()
    
    var reviews = [Review]()
    
    private init() {
        
    }
}
