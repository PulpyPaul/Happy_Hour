//
//  ReviewData.swift
//  Happy_Hour
//
//  Created by Student on 4/19/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

// ----------- Imports -----------------
import Foundation
import CoreLocation
import MapKit

// Codable struct for holding a list of reviews
public struct ReviewList: Codable {
    var reviews: [Review]
    
    init() {
        reviews = [Review]()
    }
}

// Codable review class, the primary data model object
public class Review: NSObject, Codable {
    
    // ------------ ivars -----------------
    var name: String
    var age: String
    var address: String
    var atmosphere: String
    var drinks: String
    var specials: String
    var rating: String
    var longitude : Double
    var latitude: Double
    
    // Codable enums
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case address
        case atmosphere
        case drinks
        case specials
        case rating
        case longitude
        case latitude
    }
    
    // --------------------- Initializers --------------------
    init(name: String, age: String, address: String, atmosphere: String, drinks: String, specials: String, rating: String, longitude: Double, latitude: Double) {
        self.name = name
        self.age = age
        self.address = address
        self.atmosphere = atmosphere
        self.drinks = drinks
        self.specials = specials
        self.rating = rating
        self.longitude = longitude
        self.latitude = latitude
    }
    
    // Init for decoding the data
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            self.name = try values.decode(String.self, forKey: .name)
        } catch {
            self.name = "No title found"
        }
        
        self.age = try values.decode(String.self, forKey: .age)
        self.address = try values.decode(String.self, forKey: .address)
        self.atmosphere = try values.decode(String.self, forKey: .atmosphere)
        self.drinks = try values.decode(String.self, forKey: .drinks)
        self.specials = try values.decode(String.self, forKey: .specials)
        self.rating = try values.decode(String.self, forKey: .rating)
        self.latitude = try values.decode(Double.self, forKey: .latitude)
        self.longitude = try values.decode(Double.self, forKey: .longitude)
    }
}

// --------------- Extensions --------------------
extension Review: MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(CLLocationDegrees(latitude),CLLocationDegrees(longitude))
    }
    
    public var title: String? {
        return name
    }
}

