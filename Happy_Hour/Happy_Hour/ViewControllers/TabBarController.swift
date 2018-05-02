//
//  TabBarController.swift
//  Happy_Hour
//
//  Created by Student on 4/19/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Gives the Table View Controller a reference to the app controller singleton
        //let reviewVC = segue.destination.childViewControllers[0] as! ReviewTableVC
        //reviewVC.appController = appController
    }
}
