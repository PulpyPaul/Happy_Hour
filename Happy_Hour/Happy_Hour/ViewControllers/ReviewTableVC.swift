//
//  ReviewTableVC.swift
//  Happy_Hour
//
//  Created by Student on 4/7/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

// ----------------- Imports -------------------
import Foundation
import UIKit

class ReviewTableVC : UITableViewController {
    
    // ----------- Storyboard Segues & Functions -------------------------
    
    // unwind segue for the Cancel button
    @IBAction func unwindWithCancelTapped( segue: UIStoryboardSegue) {
        
    }
    
    // Segues to the AddReviewVC controller
    @IBAction func addReviewSegue(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addReviewSegue", sender: nil)
    }
    
    // Passes an index to the infoVC to access the review data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            let infoVC = segue.destination as! InfoViewController
            infoVC.reviewIndex = selectedRow
        }
    }
    
    // ---------------- View Controller Functions ------------------------
    
    // Reloads data when view appears
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // Creates one section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Creates a number of rows based on the length of review data
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReviewData.sharedData.reviews.count
    }
    
    // Creates a cell for each review in the list
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath)
        cell.textLabel?.text = ReviewData.sharedData.reviews[indexPath.row].name
        cell.textLabel?.textColor = UIColor(red: 221/255, green: 114/255, blue: 48/255, alpha: 1.0)
        return cell
    }
}
