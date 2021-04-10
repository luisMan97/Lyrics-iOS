//
//  DatabaseManager.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import UIKit
import CoreData

class DatabaseManager {
        
    private var persistentContainer: NSPersistentContainer!
    
    var managedContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init() {
        saveAutomatically()
    }
    
    func prepare(modelName: String) {
        let container = NSPersistentContainer(name: modelName)
        persistentContainer = container
        container.loadPersistentStores { (storesDescription, error) in
            if let error = error {
                print("Unresolved error \(error.localizedDescription)")
            }
        }
    }
    
    private func saveAutomatically() {
        let center = NotificationCenter.default
        let notification = UIApplication.willResignActiveNotification

        center.addObserver(forName: notification, object: nil, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            self.saveContext()
        }
    }
    
    func saveContext() {
        guard managedContext.hasChanges else {
            return
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Ops, ocurrio algo \(error.localizedDescription)")
        }
    }
}
