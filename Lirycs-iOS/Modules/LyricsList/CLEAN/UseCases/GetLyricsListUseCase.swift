//
//  GetLyricsListUseCase.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Combine

class GetLyricsListUseCase: ObservableObject {
    
    // Repository
    private var repository: LyricsListRepository
    
    // MARK: - Initializers
    
    init(repository: LyricsListRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke() -> [LyricsList.Sone.Domain] {
        let songs = repository.getLyricsList()
        let filteredSongs = songs.filterDuplicates { $0.title == $1.title && $0.artist == $1.artist }
        return filteredSongs
    }

}
