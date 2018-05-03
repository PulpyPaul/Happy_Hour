//
//  MapVC.swift
//  Happy_Hour
//
//  Created by student on 5/2/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class MapVC : UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapItem: MKMapView!
    
    let metersPerMile: Double = 1609.344
    let mapScale: Double = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if ReviewData.sharedData.reviews.count == 0 {
            return
        }
        
        mapItem.addAnnotations(ReviewData.sharedData.reviews as [MKAnnotation])
        
        for review in ReviewData.sharedData.reviews {
            if review.coordinate.latitude == 0 && review.coordinate.longitude == 0 {
                mapItem.removeAnnotation(review)
            } else {
                let myRegion = MKCoordinateRegionMakeWithDistance(review.coordinate, metersPerMile * mapScale, metersPerMile * mapScale)
                mapItem.setRegion(myRegion, animated: true)
            }
        }
    }
}
