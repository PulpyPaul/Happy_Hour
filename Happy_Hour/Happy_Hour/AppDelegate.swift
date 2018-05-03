//
//  AppDelegate.swift
//  Happy_Hour
//
//  Created by Student on 4/7/18.
//  Copyright © 2018 DeSimone.Federico. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // -------------- Loads Review Data ------------------------------
        let path = FileManager.filePathInDocumentsDirectory(filename: "reviews.json")
        
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: path)
            let reviewList = try decoder.decode(ReviewList.self, from: data)
            ReviewData.sharedData.reviews = reviewList.reviews
        } catch {
            print("Failed to load json data")
        }
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
        // --------------- Saves Review data ---------------------------
        var reviewList = ReviewList()
        reviewList.reviews = ReviewData.sharedData.reviews
        
        // Gets a path reference for the review
        let reviewPath = FileManager.filePathInDocumentsDirectory(filename: "reviews.json")
        
        // Writes JSON data to review.json
        if let encodedData = try? JSONEncoder().encode(reviewList) {
            do {
                try encodedData.write(to: reviewPath)
                print("Filed Saved")
            } catch {
                print("Failed to write JSON data: \(error.localizedDescription)")
            }
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        // --------------- Saves Review data ---------------------------
        var reviewList = ReviewList()
        reviewList.reviews = ReviewData.sharedData.reviews
        
        // Gets a path reference for the review
        let reviewPath = FileManager.filePathInDocumentsDirectory(filename: "reviews.json")
        
        // Writes JSON data to review.json
        if let encodedData = try? JSONEncoder().encode(reviewList) {
            do {
                try encodedData.write(to: reviewPath)
                print("Filed Saved")
            } catch {
                print("Failed to write JSON data: \(error.localizedDescription)")
            }
        }
    }


}

