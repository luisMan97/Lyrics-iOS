//
//  Song+CoreDataProperties.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var artist: String?
    @NSManaged public var lyrics: String?
    @NSManaged public var title: String?
    
    func toDomain() -> LyricsList.Sone.Domain {
        .init(artist: artist ?? "", lyrics: lyrics ?? "", title: title ?? "")
    }

}

extension Song : Identifiable {

}
