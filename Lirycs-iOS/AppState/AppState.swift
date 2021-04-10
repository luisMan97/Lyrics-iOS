//
//  AppState.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation

/**
 - Author: Jorge Luis Rivera Ladino
 - Important: Don't abuse this singleton class, use only if this really required to have a shared property throughout the application cycle
 */

class AppState {
    
    private init() { }
    
    static let shared = AppState()

    var databaseManager: DatabaseManager!
}
