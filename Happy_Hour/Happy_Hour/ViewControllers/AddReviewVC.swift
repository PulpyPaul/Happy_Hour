//
//  AddReviewVC.swift
//  Happy_Hour
//
//  Created by student on 5/1/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

// ---------------- Imports -----------------
import Foundation
import UIKit
import MapKit

class AddReviewVC : UIViewController {
    
    // ------------ iVars ---------------------
    
    // references a coordinate this is saved to the review data model for a specific review
    var coordinate = CLLocationCoordinate2D()
    
    // --------------IB Outlets --------------------
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var atmosphere: UITextField!
    @IBOutlet weak var drinks: UITextField!
    @IBOutlet weak var specials: UITextField!
    @IBOutlet weak var rating: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    // --------------- IB Actions ----------------------
    
    @IBAction func submitReview(_ sender: Any) {
        getCoordinate(addressString: address.text!)
    }
    
    // ---------------- View Controller Functions ------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Changes style properties of buttons
        submitButton.backgroundColor = UIColor(red: 255/255, green: 192/255, blue: 127/255, alpha: 1.0)
        submitButton.layer.cornerRadius = 10
    }
    
    // ----------------- Helper Functions --------------------
    
    // Creates a coordinate based on an address string and creates a review based on the result
    func getCoordinate(addressString : String) {
        
        // Reference for a geocoder
        let geocoder = CLGeocoder()
        
        // Apple API function that converts a string to a coordinate
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            
            if error == nil {
                
                // Successful result, creates a review with a valid coordinate and returns to previous view
                if let placemark = placemarks?[0] {
                    let location = placemark.location?.coordinate
                    self.coordinate = location!
                    self.createReview()
                    self.dismiss(animated: true, completion: nil)
                }
            } else {
                
                // Failed result, creates a review with an empty coordinate
                self.coordinate = CLLocationCoordinate2D()
                self.createReview()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    // Creates a review based on the UIText fields and appends to review data
    func createReview() {
        
        //  Creates review object
        let review = Review(name: name.text!, age: age.text!, address: address.text!, atmosphere: atmosphere.text!, drinks: drinks.text!, specials: specials.text!, rating: rating.text!, longitude: coordinate.longitude, latitude: coordinate.latitude)
        
        // Appends it to the data
        ReviewData.sharedData.reviews.append(review)
    }
}
