//
//  GetLyricsSearchUseCase.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Combine

class GetLyricsSearchUseCase: ObservableObject {
    
    // Repository
    private var repository: LyricsSearchRepository
    
    // MARK: - Initializers
    
    init(repository: LyricsSearchRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke(request: LyricsSearch.Lyric.Request) -> AnyPublisher<LyricsSearch.Lyric.Domain?, Error>? {
        repository.searchLyric(request: request)
    }

}
