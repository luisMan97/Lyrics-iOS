//
//  LyricsListViewModel.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Combine

class LyricsListViewModel: ObservableObject {
    
    // Internal Output Events Properties
    @Published var showProgress = false
    @Published var listSongs: [LyricsList.Sone.Domain] = []
    
    // Internal Properties
    var progressTitle = ""
    
    // Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    // Interactor
    private var getLyricsListUseCase: GetLyricsListUseCase
    
    // MARK: - Initializers
    
    init(getLyricsListUseCase: GetLyricsListUseCase) {
        self.getLyricsListUseCase = getLyricsListUseCase
    }
    
    // MARK: - Internal Methods
    
    func getLyricsList() {
        let sonngs = getLyricsListUseCase.invoke()
        listSongs = sonngs
    }

}
