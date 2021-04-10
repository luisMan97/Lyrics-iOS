//
//  GenericButtonView.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import SwiftUI

struct GenericButtonView: View {
    
    var text: String
    var textColor: Color = .white
    var borderColor: Color = .white
    var backgroundColor: Color?
    var horizontalPadding: CGFloat = 39
    var cornerRadius: CGFloat = 0
    
    var onTap: () -> ()

    var body: some View {
        Button(action: {
            self.onTap()
        }, label: {
            Text(text)
                .font(.system(.body, design: .rounded))
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(textColor)
                .padding()
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor)
                )
        })
        .padding(.horizontal, horizontalPadding)
    }
    
}

struct GenericButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GenericButtonView(text: "Buscar") {
            print("Button is pressed")
        }
        .padding()
        .background(Color.gray)
    }
}
