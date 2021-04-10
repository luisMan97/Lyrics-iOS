//
//  LyricsSearchDao.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation
import CoreData

class LyricsSearchDao {
    
    private var managedContext: NSManagedObjectContext
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    // Create
    
    func saveLyrics() {
        saveContext()
    }
    
    // Read
    
    func getLyricsList() -> [Song] {
        let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()
        
        do {
            let coreDataSongs = try managedContext.fetch(fetchRequest)
            
            return coreDataSongs
        } catch {
            print("Algo ocurrio: \(error.localizedDescription)")
        }
        
        return []
    }
    
}

private extension LyricsSearchDao {
    
    func saveContext() {
        do {
            try managedContext.save()
        } catch {
            print("Error saving managed object context: \(error.localizedDescription)")
        }
    }
    
}
