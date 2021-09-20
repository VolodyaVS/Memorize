//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Vladimir Stepanchikov on 02.04.2021.
//  Copyright © 2021 Vladimir Stepanchikov. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 1)) {
                        viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(.orange)
            Button(action: {
                withAnimation(.easeInOut(duration: 1)) {
                    viewModel.resetGame()
                }
            }, label: {
                Text("New Game")
            })
        }
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    @State private var animatedBonusRemaining = 0.0

    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }

    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle.degrees(0-90),
                            endAngle: Angle.degrees(-animatedBonusRemaining*360-90))
                            .onAppear {
                                startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(0-90),
                            endAngle: Angle.degrees(-card.bonusRemaining*360-90))
                    }

                }.padding(5).opacity(0.4)
                .transition(.identity)
                Text(card.content)
                    .font(.system(size: fontSize(for: size)))
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? .linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(.scale)
        }
    }

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}

