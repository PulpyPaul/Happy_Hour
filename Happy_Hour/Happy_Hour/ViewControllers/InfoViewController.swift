//
//  InfoViewController.swift
//  Happy_Hour
//
//  Created by Student on 4/7/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var ageText: UILabel!
    @IBOutlet weak var addressText: UILabel!
    @IBOutlet weak var atmosphereText: UILabel!
    @IBOutlet weak var drinkText: UILabel!
    @IBOutlet weak var specialsText: UILabel!
    @IBOutlet weak var ratingText: UILabel!
    
    var dataIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText.text = ReviewData.sharedData.reviews[dataIndex].name
        ageText.text = ReviewData.sharedData.reviews[dataIndex].age
        addressText.text = ReviewData.sharedData.reviews[dataIndex].address
        atmosphereText.text = ReviewData.sharedData.reviews[dataIndex].atmosphere
        drinkText.text = ReviewData.sharedData.reviews[dataIndex].drinks
        specialsText.text = ReviewData.sharedData.reviews[dataIndex].specials
        ratingText.text = ReviewData.sharedData.reviews[dataIndex].rating
    }
}
