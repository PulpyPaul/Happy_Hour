//
//  ReviewTableVC.swift
//  Happy_Hour
//
//  Created by Student on 4/7/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import Foundation
import UIKit

class ReviewTableVC : UITableViewController {
    
    @IBAction func unwindWithCancelTapped(segue: UIStoryboardSegue) {
        print("Cancel tapped")
    }
    
    @IBAction func unwindWithDoneTapped(segue: UIStoryboardSegue) {
        
        // Creates review dictionary object with test values
        let review = NSMutableDictionary()
        review["barName"] = "McGregors"
        review["ageGroup"] = 45
        
        // Gets a path reference for the review
        let reviewPath = FileManager.filePathInDocumentsDirectory(filename: "reviews.json")
        
        // Creates JSON object from review object
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: review, options: [])
            print(NSString(data: jsonData, encoding: 1)!)
            
            // Writes JSON data to file
            if review.write(to: reviewPath, atomically: true) {
                print("Saved Review!")
            } else {
                print("Failed to save review")
            }
        } catch let error{
            print(error)
            print("Could not convert data to json")
        }

        let result = FileManager.fileExistsInDocumentsDirectory(filename: "reviews.json")
        print(reviewPath.path)
        print("Path exists: \(result)")
        
        print("Done Tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath)
        cell.textLabel?.text = "Test"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            let infoVC = segue.destination as! InfoViewController
        }
    }
    
    @objc func addItem() {
        performSegue(withIdentifier: "addReviewSegue", sender: nil)
    }
    
    func saveReview(barName: String, path: URL) throws {
        
        try barName.write(to: path, atomically: true, encoding: .utf8)
        print("Saved to path: \(path)")
    }
}
