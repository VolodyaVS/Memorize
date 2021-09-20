//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Vladimir Stepanchikov on 02.04.2021.
//  Copyright © 2021 Vladimir Stepanchikov. All rights reserved.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
