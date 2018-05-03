//
//  InfoViewController.swift
//  Happy_Hour
//
//  Created by Student on 4/7/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

// ------------------- Imports -----------------
import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    // ---------------- iVars ------------------
    
    // This value is assigned in ReviewTableVC when a user clicks on a selected cell
    var reviewIndex = 0
    
    // -----------------IB Outlets -------------------
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var ageText: UILabel!
    @IBOutlet weak var addressText: UILabel!
    @IBOutlet weak var atmosphereText: UILabel!
    @IBOutlet weak var drinkText: UILabel!
    @IBOutlet weak var specialsText: UILabel!
    @IBOutlet weak var ratingText: UILabel!
    
    // ---------------- View Controller Functions --------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assigns from review data model based on the selected index
        
        nameText.text = ReviewData.sharedData.reviews[reviewIndex].name
        ageText.text = ReviewData.sharedData.reviews[reviewIndex].age
        addressText.text = ReviewData.sharedData.reviews[reviewIndex].address
        atmosphereText.text = ReviewData.sharedData.reviews[reviewIndex].atmosphere
        drinkText.text = ReviewData.sharedData.reviews[reviewIndex].drinks
        specialsText.text = ReviewData.sharedData.reviews[reviewIndex].specials
        ratingText.text = ReviewData.sharedData.reviews[reviewIndex].rating
    }
}
