//
//  PublisherExtensions.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Combine

extension Publisher where Output == String {
    
    func isStringNotEmpty() -> Publishers.Map<Self, Bool> {
        map {
            !$0.isEmpty
        }
    }

}

