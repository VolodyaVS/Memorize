//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Vladimir Stepanchikov on 30.06.2021.
//  Copyright © 2021 Vladimir Stepanchikov. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
