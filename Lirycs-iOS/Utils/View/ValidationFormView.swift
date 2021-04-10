//
//  ValidationFormView.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import SwiftUI

struct ValidationFormView: View {
    
    var formText = ""
    var font: Font = .system(.body, design: .rounded)
    var show = false
    var horizontalPadding: CGFloat = 38
    var withBottomSpacer = true
    var colorText: Color = .colorYellow
        
    var body: some View {
        HStack {
            if show {
                Text(formText)
                    .font(font)
                    .foregroundColor(colorText)
            }
            
            if withBottomSpacer {
                Spacer()
            }
        }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, horizontalPadding)
            .padding(.bottom)
    }
    
}

struct ValidationFormView_Previews: PreviewProvider {
    static var previews: some View {
        ValidationFormView(formText: "", show: true)
    }
}
