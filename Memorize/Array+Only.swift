//
//  Array+Only.swift
//  Memorize
//
//  Created by Vladimir Stepanchikov on 30.06.2021.
//  Copyright © 2021 Vladimir Stepanchikov. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
