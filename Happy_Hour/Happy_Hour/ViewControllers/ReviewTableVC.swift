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
    
    @IBAction func unwindWithReturnTapped( segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    @IBAction func addReviewSegue(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addReviewSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.textLabel?.textColor = UIColor(red: 221/255, green: 114/255, blue: 48/255, alpha: 1.0)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            let infoVC = segue.destination as! InfoViewController
            infoVC.dataIndex = selectedRow
        }
    }
}
