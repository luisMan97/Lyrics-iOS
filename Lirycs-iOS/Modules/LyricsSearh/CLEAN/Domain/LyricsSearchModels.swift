//
//  LyricsSearchModels.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation

enum LyricsSearch {
    
    enum Lyric {
    
        struct Request {
            let artist: String
            let title: String
        }
        
        struct Response: Codable {
            let lyricBody: String?
            
            private enum CodingKeys: String, CodingKey {
                case lyricBody = "lyrics"
            }
        }
        
        struct Domain {
            let lyricBody: String?
        }
        
    }
    
    enum LastLyric {
        
        struct Domain {
            let artist: String
            let title: String
            let lyricBody: String
        }
        
    }
    
}

extension LyricsSearch.Lyric.Response {
    
    func toDomain() -> LyricsSearch.Lyric.Domain {
        LyricsSearch.Lyric.Domain(lyricBody: lyricBody)
    }
    
}

extension LyricsSearch.LastLyric.Domain {
    
    func toCoreDataSong(_ song: Song) {
        song.artist = artist
        song.title = title
        song.lyrics = lyricBody
    }
    
}
