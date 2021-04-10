//
//  RemoteLyricsSearchDataSource.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Combine

protocol RemoteLyricsSearchDataSource {
        
    func searchLyrics(request: LyricsSearch.Lyric.Request) -> AnyPublisher<LyricsSearch.Lyric.Domain?, Error>
    
}
