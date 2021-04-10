//
//  ArrayExtensions.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import Foundation

extension Array {

    func filterDuplicates(includeElement: (_ lhs: Element, _ rhs: Element) -> Bool) -> [Element] {
        var results: [Element] = []

        forEach { element in
            let existingElements = results.filter {
                includeElement(element, $0)
            }
            if existingElements.count == 0 {
                results.append(element)
            }
        }

        return results
    }
}
