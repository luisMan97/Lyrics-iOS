//
//  GetLastLyricsUseCase.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Combine

class GetLastLyricsUseCase: ObservableObject {
    
    // Repository
    private var repository: LyricsSearchRepository
    
    // MARK: - Initializers
    
    init(repository: LyricsSearchRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke() -> LyricsSearch.LastLyric.Domain? {
        let lastLyric = repository.getLastLyrics()
        let title = lastLyric.title
        if !title.isEmpty {
            return lastLyric
        }
        
        return nil
    }

}
