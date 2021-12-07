//
//  DataController.swift
//  CoreDataProject
//
//  Created by Dmitry Sharabin on 07.12.2021.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription).")
            }
        }
    }
}
