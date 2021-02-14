//
//  ContentView.swift
//  Memorize
//
//  Created by Дарья on 18.01.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.75)) {
                            self.viewModel.choose(card: card)
                        }
                }
                .padding(5)
            }
            .padding(5)
            Spacer()
            Button(action: {
                withAnimation(.easeInOut) {
                    self.viewModel.restartGame()
                }
            }, label: {
                Text("Restart")
            })
            .padding()
        }
    }
}

struct CardView: View {
    
    var card: MemoryGame.Card
    @State private var endAngle: Double = 20
    
    var body: some View {
        GeometryReader { geometry in
            if !self.card.isMatched {
                ZStack {
                    if self.card.isFaceUp {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.orange, lineWidth: 4)
//                        PieShape(startAngle: .degrees(-90), endAngle: .degrees(self.endAngle))
//                            .foregroundColor(.orange)
//                            .opacity(0.5)
//                            .padding(5)
//                            .onAppear {
//                                withAnimation(.linear) {
//                                    self.endAngle = 90
//                                }
//                        }
                        Text(self.card.content)
                            .font(Font.system(size: self.getFontSize(for: geometry.size)))
                            .rotationEffect(.degrees(self.card.isMatched ? 360 : 0))
                            .animation(.easeInOut(duration: 5))
                    } else {
                        RoundedRectangle(cornerRadius: 15).fill(Color.orange)
                    }
                }
                .transition(.scale)
                .rotation3DEffect(.degrees(self.card.isFaceUp ? 0 : 180), axis: (x: 0, y: 1, z: 0))
            }
        }
    }
    
    private func getFontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}



struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(emojies: ["👻", "🎃", "💀", "🔮", "🧙‍♀️", "🕷", "😱", "🧛‍♂️", "🧟‍♂️", "🧝‍♂️", "😳", "🤖"])
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
