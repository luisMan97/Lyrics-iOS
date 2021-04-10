//
//  GenericTextFieldView.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import SwiftUI

struct GenericTextFieldView: View {

    var fieldName: String
    var fontWeight: Font.Weight
    var foregroundColor: Color
    var showDivider: Bool
    var horizontalPadding: CGFloat
    var onTextChanged: ((_ characters: String) -> ())?
    
    @Binding var fieldValue: String
    
    init(fieldName: String,
         fieldValue: Binding<String>,
         fontWeight: Font.Weight,
         foregroundColor: Color = .white,
         showDivider: Bool = true,
         horizontalPadding: CGFloat = 0,
         onTextChanged: ((_ characters: String) -> ())? = nil) {
        self.fieldName = fieldName
        self._fieldValue = fieldValue
        self.fontWeight = fontWeight
        self.foregroundColor = foregroundColor
        self.showDivider = showDivider
        self.horizontalPadding = horizontalPadding
        self.onTextChanged = onTextChanged
    }
    
    var body: some View {
        VStack {
            TextField(fieldName, text: $fieldValue)
                //.modifier(PlaceholderStyle(showPlaceHolder: fieldValue.isEmpty, placeholder: fieldName, foregroundColor: foregroundColor))
                .font(.system(size: 17, weight: .semibold, design: .rounded))
                //.foregroundColor(foregroundColor)
                /*.onChange(of: fieldValue) {
                    onTextChanged?($0)
                }*/
            
            if showDivider {
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
            }
        }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, horizontalPadding)
    }
    
}

struct GenericTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        GenericTextFieldView(fieldName: "Artista", fieldValue: .constant("artista"), fontWeight: .bold, horizontalPadding: 38)
    }
}
