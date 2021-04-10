//
//  LyricsSearchCoreDataDataSoruce.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation
import CoreData

class LyricsSearchCoreDataDataSoruce: LocalLyricsSearchDataSource {
    
    var dao: LyricsSearchDao
    
    private var managedContext: NSManagedObjectContext
    
    init(dao: LyricsSearchDao, managedContext: NSManagedObjectContext) {
        self.dao = dao
        self.managedContext = managedContext
    }
    
    func saveLyrics(request: LyricsSearch.LastLyric.Domain) {
        let song = Song(context: managedContext)
        request.toCoreDataSong(song)
        dao.saveLyrics()
    }
    
    func getLastLyrics() -> LyricsSearch.LastLyric.Domain {
        let lastLyrics = getLyricsList().first
        return .init(artist: lastLyrics?.artist ?? "", title: lastLyrics?.title ?? "", lyricBody: lastLyrics?.lyrics ?? "")
    }
    
    private func getLyricsList() -> [LyricsList.Sone.Domain] {
        let coreDataSongs = dao.getLyricsList()
        var lyricsList = coreDataSongs.compactMap { song in
            song.toDomain()
        }
        lyricsList.reverse()
        return lyricsList
    }
    
}
