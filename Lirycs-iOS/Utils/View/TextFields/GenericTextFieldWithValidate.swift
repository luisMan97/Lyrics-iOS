//
//  GenericTextFieldWithValidate.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import SwiftUI

struct GenericTextFieldWithValidate: View {
    
    var fieldName: String
    var fontWeight: Font.Weight
    var foregroundColor: Color
    var showDivider: Bool
    var horizontalPadding: CGFloat
    var onTextChanged: ((_ characters: String) -> ())?
    var validationFormText = ""
    var showValidationForm = false
    
    @Binding var fieldValue: String
    
    init(fieldName: String,
         fieldValue: Binding<String>,
         fontWeight: Font.Weight,
         foregroundColor: Color = .white,
         validationFormText: String,
         showValidationForm: Bool,
         showDivider: Bool = true,
         horizontalPadding: CGFloat = 0,
         onTextChanged: ((_ characters: String) -> ())? = nil) {
        self.fieldName = fieldName
        self._fieldValue = fieldValue
        self.fontWeight = fontWeight
        self.foregroundColor = foregroundColor
        self.validationFormText = validationFormText
        self.showValidationForm = showValidationForm
        self.showDivider = showDivider
        self.horizontalPadding = horizontalPadding
        self.onTextChanged = onTextChanged
    }

    var body: some View {
        VStack {
            GenericTextFieldView(fieldName: fieldName,
                                 fieldValue: $fieldValue,
                                 fontWeight: fontWeight,
                                 foregroundColor: foregroundColor,
                                 showDivider: showDivider,
                                 horizontalPadding: horizontalPadding,
                                 onTextChanged: onTextChanged
            )
            
            ValidationFormView(formText: validationFormText,
                               show: showValidationForm
            )
            .animation(.easeInOut(duration: 0.5))
        }
    }
    
}
