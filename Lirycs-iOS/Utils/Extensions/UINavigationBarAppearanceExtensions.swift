//
//  UINavigationBarAppearanceExtensions.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 10/04/21.
//

import UIKit

extension UINavigationBarAppearance {
    
    func setup(backgroundColor: UIColor) -> UINavigationBarAppearance {
    
        let apperance = UINavigationBarAppearance()
        
        apperance.largeTitleTextAttributes = [
            //.font: UIFont.systemFont(ofSize: 32),
            .foregroundColor: UIColor.white
        ]
        apperance.titleTextAttributes = [
            //.font: UIFont.systemFont(ofSize: 22),
            .foregroundColor: UIColor.white
        ]
        
        apperance.backgroundColor = backgroundColor
        
        return apperance
    }
    
}
