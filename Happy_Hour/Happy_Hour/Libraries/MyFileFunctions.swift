//
//  MyFileFunctions.swift
//  File System Demo
//
//  Created by Student on 3/27/18.
//  Copyright © 2018 DeSimone. All rights reserved.
//

// ------------------ Imports ------------------
import Foundation
import UIKit

// Extentension for the file manager class
extension FileManager {
    
    // --------------- Static Functions --------------
    
    // gets the documents directory
    static var documentsDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    // gets the caches directory
    static var cachesDirectory: URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
    
    // gets the temporary directory
    static var tempDirectory: String {
        return NSTemporaryDirectory()
    }
    
    // gets a file path inside the documents directory
    static func filePathInDocumentsDirectory(filename: String) -> URL {
        return FileManager.documentsDirectory.appendingPathComponent(filename)
    }
    
    // checks if a file exists in the documents directory
    static func fileExistsInDocumentsDirectory(filename: String) -> Bool {
        let path = FileManager.filePathInDocumentsDirectory(filename: filename)
        return FileManager.default.fileExists(atPath: path.path)
    }
    
    // deletes a file in the documents directory
    static func deleteFileInDocumentsDirectory(filename: String) {
        let path = filePathInDocumentsDirectory(filename: filename).path
        do {
            try FileManager.default.removeItem(atPath: path)
            print("FILE: \(path) was deleted!")
        } catch {
            print("ERROR: \(error) - FOR FILE: \(path)")
        }
    }
    
    // gets the contents of a directory at a given path
    static func contentsOfDir(url:URL)->[String]{
        do {
            if let paths = try FileManager.default.contentsOfDirectory(atPath: url.path) as [String]?{
                return paths
            } else {
                print("none found")
                return [String]()
            }
        } catch {
            print("ERROR: \(error)")
            return [String]()
        }
    }
    
    // clears the doucments directory
    static func clearDocumentsFolder() {
        let fileManager = FileManager.default
        let docsFolderPath = FileManager.documentsDirectory.path
        do {
            let filePaths = try fileManager.contentsOfDirectory(atPath: docsFolderPath)
            for filePath in filePaths {
                try fileManager.removeItem(atPath: docsFolderPath + "/" + filePath)
            }
            print("Cleared Documents Folder")
        } catch {
            print("Could not clear Documents folder: \(error)")
        }
    }
}



