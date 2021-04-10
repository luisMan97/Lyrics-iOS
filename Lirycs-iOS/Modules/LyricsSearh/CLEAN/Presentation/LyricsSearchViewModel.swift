//
//  LyricsSearchViewModel.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Combine
import Foundation

class LyricsSearchViewModel: ObservableObject {
    
    // Internal Input Properties
    @Published var artist = ""
    @Published var title = ""
    
    // Internal Output Events Properties
    @Published var showProgress = false
    @Published var domain: LyricsSearch.Lyric.Domain?
    @Published var lastLyric: LyricsSearch.LastLyric.Domain?
    @Published var presentLyrics = false
    @Published var error: IdentifiableError?
    @Published var showArtistNotFound = false
    @Published var showErrorArtistText = false
    @Published var showErrorTitleText = false
    
    // Private Events Properties
    @Published private var artistLengthIsValid = false
    @Published private var titleLengthIsValid = false
    @Published private var showErrorArtist = false
    @Published private var showErrorTitle = false
    
    // Internal Properties
    var progressTitle = ""
    
    // Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    // Interactor
    private var getLyricsSearchUseCase: GetLyricsSearchUseCase
    private var validateFormTextsUseCase: ValidateFormTextsUseCase
    private var saveSongUseCase: SaveSongUseCase
    private var getLastLyricsUseCase: GetLastLyricsUseCase
    
    // MARK: - Initializers
    
    init(getLyricsSearchUseCase: GetLyricsSearchUseCase,
         validateFormTextsUseCase: ValidateFormTextsUseCase,
         saveSongUseCase: SaveSongUseCase,
         getLastLyricsUseCase: GetLastLyricsUseCase
    ) {
        self.getLyricsSearchUseCase = getLyricsSearchUseCase
        self.validateFormTextsUseCase = validateFormTextsUseCase
        self.saveSongUseCase = saveSongUseCase
        self.getLastLyricsUseCase = getLastLyricsUseCase
        
        publishedAssign()
    }
    
    // MARK: - Internal Methods
    
    func searchLyrics() {
        guard artistLengthIsValid else {
            showErrorArtist = true
            return
        }
        
        guard titleLengthIsValid else {
            showErrorTitle = true
            return
        }
        
        progressTitle = "Cargando..."
        showProgress = true
        
        let request = LyricsSearch.Lyric.Request(artist: artist, title: title)
        
        getLyricsSearchUseCase.invoke(request: request)?
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case let .failure(error) = subscriptionCompletion {
                    if error.localizedDescription == "A data connection is not currently allowed." {
                        self?.error = IdentifiableError(message: "Para realizar una busqueda debes estar conectado a Internet.")
                    } else {
                        self?.error = IdentifiableError(message: error.localizedDescription)
                    }
                }
                
                self?.showProgress = false
            }, receiveValue: { [weak self] (value: LyricsSearch.Lyric.Domain?) in
                if value?.lyricBody == nil {
                    self?.showArtistNotFound = true
                    return
                }
                
                self?.showArtistNotFound = false
                self?.domain = value
                if let artist = self?.artist,
                   let title = self?.title,
                   let lyricBody = value?.lyricBody {
                    self?.lastLyric = .init(artist: artist, title: title, lyricBody: lyricBody)
                    self?.saveSongUseCase.invoke(request: LyricsSearch.LastLyric.Domain(artist: artist, title: title, lyricBody: lyricBody))
                }
                self?.presentLyrics = true
            })
            .store(in: &subscriptions)
    }
    
    func getLastLyrics() {
        if let lastLyric = getLastLyricsUseCase.invoke() {
            self.lastLyric = lastLyric
        }
    }
    
    // MARK: - Private Methods
    
    private func publishedAssign() {
        Publishers.CombineLatest($artistLengthIsValid, $showErrorArtist)
            .map {
                let artistLengthIsNotValid = !$0
                return artistLengthIsNotValid && $1
            }
            .assign(to: \.showErrorArtistText, on: self)
            .store(in: &subscriptions)
        
        Publishers.CombineLatest($titleLengthIsValid, $showErrorTitle)
            .map {
                let titleLengthIsValid = !$0
                return titleLengthIsValid && $1
            }
            .assign(to: \.showErrorTitleText, on: self)
            .store(in: &subscriptions)
        
        assignToViewModel()
        assignToInteractor()
    }
    
    private func assignToViewModel() {
        validateFormTextsUseCase.$artistLengthValid
            .assign(to: \.artistLengthIsValid, on: self)
            .store(in: &subscriptions)
        
        validateFormTextsUseCase.$titleLengthValid
            .assign(to: \.titleLengthIsValid, on: self)
            .store(in: &subscriptions)
    }
    
    private func assignToInteractor() {
        $artist
            .assign(to: \.validateFormTextsUseCase.artist, on: self)
            .store(in: &subscriptions)
        
        $title
            .assign(to: \.validateFormTextsUseCase.title, on: self)
            .store(in: &subscriptions)
    }

}
