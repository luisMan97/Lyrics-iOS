//
//  LyricsSearchRepository.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Combine

class LyricsSearchRepository: ObservableObject {
    
    private var remoteDataSource: RemoteLyricsSearchDataSource
    private var localDataSource: LocalLyricsSearchDataSource
    
    init(remoteDataSource: RemoteLyricsSearchDataSource, localDataSource: LocalLyricsSearchDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func searchLyric(request: LyricsSearch.Lyric.Request) -> AnyPublisher<LyricsSearch.Lyric.Domain?, Error>? {
        remoteDataSource.searchLyrics(request: request)
            .eraseToAnyPublisher()
    }
    
    func saveLyrics(request: LyricsSearch.LastLyric.Domain) {
        localDataSource.saveLyrics(request: request)
    }
    
    func getLastLyrics() -> LyricsSearch.LastLyric.Domain {
        localDataSource.getLastLyrics()
    }
    
}
