//
//  AddReviewVC.swift
//  Happy_Hour
//
//  Created by student on 5/1/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AddReviewVC : UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var atmosphere: UITextField!
    @IBOutlet weak var drinks: UITextField!
    @IBOutlet weak var specials: UITextField!
    @IBOutlet weak var rating: UITextField!
    
    @IBAction func submitReview(_ sender: Any) {
        
        //  Creates review object
        let review = Review(name: name.text!, age: age.text!, address: address.text!, atmosphere: atmosphere.text!, drinks: drinks.text!, specials: specials.text!, rating: rating.text!)
       
        // Appends it to the data
        ReviewData.sharedData.reviews.append(review)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCoordinate(addressString: "143 Vern Lane Cheektowaga NY")
        
    }
    
    func getCoordinate(addressString : String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location?.coordinate
                    print(location!)
                    return
                }
            }
            
        }
    }
}
