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
        
        // Creates the review object
        let review = Review(name: "testBar4", ageGroup: "18-25", address: "333 Test")
        
        // Gets a path reference for the review
        let reviewPath = FileManager.filePathInDocumentsDirectory(filename: "reviews.json")
        
        // Writes JSON data to review.json
        if let encodedData = try? JSONEncoder().encode(review) {
            do {
                try encodedData.write(to: reviewPath)
                let result = FileManager.fileExistsInDocumentsDirectory(filename: "reviews.json")
                print(reviewPath.path)
                print("Path exists: \(result)")
            }
            catch {
                print("Failed to write JSON data: \(error.localizedDescription)")
            }
        }
        
        loadData()
        
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
        
        return ReviewData.sharedData.reviews.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath)
        cell.textLabel?.text = ReviewData.sharedData.reviews[indexPath.row].name
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
    
    func loadData() {
        let path = FileManager.filePathInDocumentsDirectory(filename: "reviews.json")
        
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: path)
            let reviewList = try decoder.decode(ReviewList.self, from: data)
            ReviewData.sharedData.reviews = reviewList.reviews
        } catch {
            print("Failed to load json data")
        }
    }
}
