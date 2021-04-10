//
//  ValidateFormTextsUseCase.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation
import Combine

class ValidateFormTextsUseCase: ObservableObject {
    
    // Internal Input Properties
    @Published var artist = ""
    @Published var title = ""
    
    // Internal Output Events Properties
    @Published var artistLengthValid = false
    @Published var titleLengthValid = false
    
    // Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    init() {
        publishedAssign()
    }
    
    // MARK: - Private Methods
    
    private func publishedAssign() {
        validateFields()
    }
    
    private func validateFields() {
        $artist
            .receive(on: RunLoop.main)
            .isStringNotEmpty()
            .assign(to: \.artistLengthValid, on: self)
            .store(in: &subscriptions)
        
        $title
            .receive(on: RunLoop.main)
            .isStringNotEmpty()
            .assign(to: \.titleLengthValid, on: self)
            .store(in: &subscriptions)
    }
    
}
