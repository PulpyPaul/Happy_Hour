//
//  ReviewData.swift
//  Happy_Hour
//
//  Created by Student on 4/19/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import Foundation

public struct ReviewList: Codable {
    var reviews: [Review]
}

public class Review: NSObject, Codable {
    
    var name: String
    var ageGroup: String
    var address: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case ageGroup
        case address
    }
    
    init(name: String, ageGroup: String, address: String) {
        self.name = name
        self.ageGroup = ageGroup
        self.address = address
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            self.name = try values.decode(String.self, forKey: .name)
        } catch {
            self.name = "No title found"
        }
        
        self.ageGroup = try values.decode(String.self, forKey: .ageGroup)
        
        self.address = try values.decode(String.self, forKey: .address)
    }
    
}

