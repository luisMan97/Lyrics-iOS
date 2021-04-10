//
//  PlaceholderStyle.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import SwiftUI

struct PlaceholderStyle: ViewModifier {
    
    var showPlaceHolder: Bool
    var placeholder: String
    var foregroundColor: Color

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .foregroundColor(foregroundColor)
            }
            content
                .foregroundColor(foregroundColor)
        }
    }
}
