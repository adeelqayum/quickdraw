//
//  QDLibrary.swift
//  QuickDraw
//
//  Created by Adeel Qayum on 11/18/18.
//  Copyright © 2018 Adeel Qayum. All rights reserved.
//

import Foundation

class QDLibrary: NSObject, Codable {
    
    var objects = [QDDocument]()
    
    var numObjects = 0
    
    override init() {
        super.init()
        addItem(QDDocument(title: "Untitled \(numObjects)"))
    }
    
    func addItem(_ item: QDDocument) {
        objects.append(item)
        numObjects += 1
    }
    
    func removeItem(at index: Int) {
        objects.remove(at: index)
    }
    
    func moveItem(fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let item = objects[fromIndex]
            objects.remove(at: fromIndex)
            objects.insert(item, at: toIndex)
        }
    }
    
    // MARK: - NSCoder
    
    required init(coder aDecoder: NSCoder) {
        objects = aDecoder.decodeObject(forKey: "items") as! [QDDocument]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(objects, forKey: "items")
    }
}
