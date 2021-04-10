//
//  LyricsListBuilder.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Foundation

class LyricsListBuilder {
    
    class func createModule() -> LyricsListView {
        let managedContext = AppState.shared.databaseManager.managedContext
        
        // Dao
        let dao = LyricsSearchDao(managedContext: managedContext)
        
        // DataSource
        let dataSource = LyricsListCoreDataDataSource(dao: dao)
        
        // Repository
        let repository: LyricsListRepository = LyricsListRepository(dataSource: dataSource)
        
        // Interactor
        let getLyricsListUseCase = GetLyricsListUseCase(repository: repository)
        
        // ViewModel
        let viewModel = LyricsListViewModel(getLyricsListUseCase: getLyricsListUseCase)
        
        return LyricsListView(viewModel: viewModel)
    }
    
}
