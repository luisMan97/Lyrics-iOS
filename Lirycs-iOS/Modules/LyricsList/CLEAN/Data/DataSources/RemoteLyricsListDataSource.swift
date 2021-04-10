//
//  RemoteLyricsListDataSource.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Combine

protocol LocalLyricsListDataSource {
        
    func getLyricsList() -> [LyricsList.Sone.Domain]
    
}
