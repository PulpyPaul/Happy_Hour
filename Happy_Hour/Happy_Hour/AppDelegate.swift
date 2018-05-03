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
        
        // gets path reference to review.json
        let path = FileManager.filePathInDocumentsDirectory(filename: "reviews.json")
        
        // creates test data
        let testReview1 = Review(name: "MacGregor's", age: "20-30", address: "300 Jefferson Road Rochester NY", atmosphere: "Clasic Irish Pub", drinks: "Beer, Hard Cider", specials: "Special Beer", rating: "7", longitude: -77.650531000000001, latitude: 43.092409000000004)
        
        let testReview2 = Review(name: "Schramrocks Irish Pub", age: "18-25", address: "200 Park Point Drive Rochester NY", atmosphere: "Underaged raging college students", drinks: "Beer and liqour", specials: "Fishbowls", rating: "10", longitude: -77.655963, latitude: 43.091310100000001)

        // Appends it to the data
        ReviewData.sharedData.reviews.append(testReview1)
        ReviewData.sharedData.reviews.append(testReview2)
        
        // decodes data from reviws.json and assigns data to ReviewData singleton
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
        
        // creates a review list and assigns data from singleton into the list
        var reviewList = ReviewList()
        reviewList.reviews = ReviewData.sharedData.reviews
        
        // Gets a path reference for review.json
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
        
        // creates a review list and assigns data from singleton into the list
        var reviewList = ReviewList()
        reviewList.reviews = ReviewData.sharedData.reviews
        
        // Gets a path reference for review.json
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

