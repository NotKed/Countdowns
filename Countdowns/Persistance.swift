//
//  Persistance.swift
//  Countdowns
//
//  Created by Kyle Edwards on 02/01/2021.
//

import Foundation
import CoreData

struct PersistanceController {
    static let shared = PersistanceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CountdownsList")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
            
        }
    }
}
