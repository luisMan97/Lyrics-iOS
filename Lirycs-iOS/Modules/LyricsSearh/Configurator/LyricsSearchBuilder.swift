//
//  LyricsSearchBuilder.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation
import CoreData

class LyricsSearchBuilder {
    
    class func createModule(managedContext: NSManagedObjectContext) -> LyricsSearchView {
        // Worker
        let worker = APIManager()
        
        // Dao
        let dao = LyricsSearchDao(managedContext: managedContext)
    
        // DataSource
        let remoteDataSource = LyricsSearchURLSessionDataSource(apiManager: worker)
        let localDataSource = LyricsSearchCoreDataDataSoruce(dao: dao, managedContext: managedContext)
        
        // Repository
        let repository: LyricsSearchRepository = LyricsSearchRepository(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
        
        // Interactor
        let getLyricsSearchUseCase = GetLyricsSearchUseCase(repository: repository)
        let validateFormTextsUseCase = ValidateFormTextsUseCase()
        let saveSongUseCase = SaveSongUseCase(repository: repository)
        let getLastLyricsUseCase = GetLastLyricsUseCase(repository: repository)
        
        // ViewModel
        let viewModel = LyricsSearchViewModel(getLyricsSearchUseCase: getLyricsSearchUseCase,
                                              validateFormTextsUseCase: validateFormTextsUseCase,
                                              saveSongUseCase: saveSongUseCase,
                                              getLastLyricsUseCase: getLastLyricsUseCase
        )
        
        return LyricsSearchView(viewModel: viewModel)
    }
    
}
