//
//  IdentifiableError.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation

struct IdentifiableError: Identifiable {
    var id = UUID()
    var message: String
}
