//
//  LyricsListCoreDataDataSource.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Foundation
import Combine

class LyricsListCoreDataDataSource: LocalLyricsListDataSource {
    
    var dao: LyricsSearchDao
    
    init(dao: LyricsSearchDao) {
        self.dao = dao
    }
    
    func getLyricsList() -> [LyricsList.Sone.Domain] {
        let coreDataSongs = dao.getLyricsList()
        var lyricsList = coreDataSongs.compactMap { song in
            song.toDomain()
        }
        lyricsList.reverse()
        return lyricsList
    }
    
}
