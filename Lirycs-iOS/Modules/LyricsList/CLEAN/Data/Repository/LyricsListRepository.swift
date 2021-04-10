//
//  LyricsListRepository.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Combine

class LyricsListRepository: ObservableObject {
    
    private var dataSource: LocalLyricsListDataSource
    
    init(dataSource: LocalLyricsListDataSource) {
        self.dataSource = dataSource
    }
    
    func getLyricsList() -> [LyricsList.Sone.Domain] {
        dataSource.getLyricsList()
    }
    
}
