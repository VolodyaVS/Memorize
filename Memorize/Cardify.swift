//
//  Cardify.swift
//  Memorize
//
//  Created by Vladimir Stepanchikov on 17.08.2021.
//  Copyright © 2021 Vladimir Stepanchikov. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    var isFaceUp: Bool {
        rotation < 90
    }

    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidht: CGFloat = 3

    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }

    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(
                    cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(
                    cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidht)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius).fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(
            .degrees(rotation),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
