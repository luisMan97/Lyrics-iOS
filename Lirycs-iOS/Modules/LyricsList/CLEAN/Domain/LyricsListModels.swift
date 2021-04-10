//
//  LyricsListModels.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Foundation

enum LyricsList {
    
    enum Sone {
        
        struct Request {
        
        }
        
        struct Response {
        
        }
        
        struct Domain: Identifiable {
            let id = UUID()
            let artist: String
            let lyrics: String
            let title: String
        }
        
    }
    
}
