//
//  MapVC.swift
//  Happy_Hour
//
//  Created by student on 5/2/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

// ----------------- Imports ------------------
import Foundation
import MapKit
import CoreLocation

class MapVC : UIViewController, MKMapViewDelegate {
    
    // --------------- iVars ----------------
    
    let metersPerMile: Double = 1609.344
    
    // The larger the number, the larger the region
    let mapScale: Double = 2.0
    
    // ------------------ IB Outlets ----------------
    
    @IBOutlet weak var mapView: MKMapView!
    
    // ----------------- View Controller Functions -----------------
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // If there's no data, return
        if ReviewData.sharedData.reviews.count == 0 {
            return
        }
        
        // Adds annotations to the map based on review data
        mapView.addAnnotations(ReviewData.sharedData.reviews as [MKAnnotation])
        
        // Removes annotations with invalid coordinates and sets region to a location based on the last valid coordinate in review
        for review in ReviewData.sharedData.reviews {
            if review.coordinate.latitude == 0 && review.coordinate.longitude == 0 {
                mapView.removeAnnotation(review)
            } else {
                let myRegion = MKCoordinateRegionMakeWithDistance(review.coordinate, metersPerMile * mapScale, metersPerMile * mapScale)
                mapView.setRegion(myRegion, animated: true)
            }
        }
    }
}
