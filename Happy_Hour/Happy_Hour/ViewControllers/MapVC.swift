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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if ReviewData.sharedData.reviews.count == 0 {
            return
        }
        
        mapItem.addAnnotations(ReviewData.sharedData.reviews as [MKAnnotation])
        let myRegion = MKCoordinateRegionMakeWithDistance(ReviewData.sharedData.reviews[0].coordinate, metersPerMile * 100, metersPerMile * 100)
        mapItem.setRegion(myRegion, animated: true)
    }
}
