//
//  UINavigationBarExtenions.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 10/04/21.
//

import UIKit

extension UINavigationBar {
    
    func setup(backgroundColor: UIColor) {
        let apperance = UINavigationBar.appearance()
        let standardAppearance = UINavigationBarAppearance().setup(backgroundColor: backgroundColor)
        
        //apperance.setBackgroundImage(UIImage(), for: .default)
        apperance.tintColor = .white
    
        apperance.standardAppearance = standardAppearance
        apperance.compactAppearance = standardAppearance
        apperance.scrollEdgeAppearance = standardAppearance
    }
    
}
