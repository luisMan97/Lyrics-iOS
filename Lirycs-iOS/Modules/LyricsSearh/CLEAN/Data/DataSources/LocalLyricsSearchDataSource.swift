//
//  LocalLyricsSearchDataSource.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation

protocol LocalLyricsSearchDataSource {
        
    func saveLyrics(request: LyricsSearch.LastLyric.Domain)
    func getLastLyrics() -> LyricsSearch.LastLyric.Domain
    
}
