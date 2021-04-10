//
//  SaveSongUseCase.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation

class SaveSongUseCase {
    
    // Repository
    private var repository: LyricsSearchRepository
    
    // MARK: - Initializers
    
    init(repository: LyricsSearchRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke(request: LyricsSearch.LastLyric.Domain) {
        repository.saveLyrics(request: request)
    }
    
}
