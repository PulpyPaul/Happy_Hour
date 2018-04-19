//
//  MyFileFunctions.swift
//  File System Demo
//
//  Created by Student on 3/27/18.
//  Copyright © 2018 DeSimone. All rights reserved.
//

import Foundation
import UIKit

extension FileManager {
    
    static var documentsDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    static var cachesDirectory: URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
    
    static var tempDirectory: String {
        return NSTemporaryDirectory()
    }
    
    static func filePathInDocumentsDirectory(filename: String) -> URL {
        return FileManager.documentsDirectory.appendingPathComponent(filename)
    }
    
    static func fileExistsInDocumentsDirectory(filename: String) -> Bool {
        let path = FileManager.filePathInDocumentsDirectory(filename: filename)
        return FileManager.default.fileExists(atPath: path.path)
    }
    
    static func deleteFileInDocumentsDirectory(filename: String) {
        let path = filePathInDocumentsDirectory(filename: filename).path
        do {
            try FileManager.default.removeItem(atPath: path)
            print("FILE: \(path) was deleted!")
        } catch {
            print("ERROR: \(error) - FOR FILE: \(path)")
        }
    }
    
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
    
    //https://stackoverflow.com/questions/42550657/writing-json-file-programmatically-swift
    func getUploadedFileSet(filename:String) {
        if let path = Bundle.main.path(forResource: "assets/\(filename)", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {
                    // do stuff
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
}



