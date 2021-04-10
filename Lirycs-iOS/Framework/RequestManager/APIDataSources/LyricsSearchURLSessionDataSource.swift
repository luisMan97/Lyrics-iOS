//
//  LyricsSearchURLSessionDataSource.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation
import Combine

class LyricsSearchURLSessionDataSource: RemoteLyricsSearchDataSource {
    
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func searchLyrics(request: LyricsSearch.Lyric.Request) -> AnyPublisher<LyricsSearch.Lyric.Domain?, Error> {
        return searchLyricsPublisher(request: request)
            .map(mapResponseToDomain)
            .eraseToAnyPublisher()
    }
    
}

private extension LyricsSearchURLSessionDataSource {
    
    func searchLyricsPublisher(request: LyricsSearch.Lyric.Request) -> AnyPublisher<LyricsSearch.Lyric.Response, Error> {
        let parameters = [
            "artist": request.artist,
            "title": request.title,
        ] as [String : String]
        
        return APIManager
            .request(service: .Lyrics(parameters))
    }
    
    private func mapResponseToDomain(_ serverResponse: LyricsSearch.Lyric.Response) -> LyricsSearch.Lyric.Domain? {
        serverResponse.toDomain()
    }
    
}
