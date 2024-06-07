//
//  ContentView.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/6.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🐻‍❄️", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐋", "🐧", "🐦", "🐤", "🐺", "🐡"]
    @State private var cardsCount = 4
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle).bold()
            ScrollView {
                cards
            }
            Spacer()
            buttonView
        }.padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120.0))], content: {
            ForEach(0 ..< cardsCount, id: \.self) { index in
                CardView(cardText: emojis[index]).aspectRatio(4 / 3, contentMode: .fill)
            }
        }).foregroundColor(.orange)
    }

    var buttonView: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
    }

    var cardAdder: some View {
        buttonAdjust(by: 1, buttonSymbol: "rectangle.stack.badge.plus.fill", buttonName: "添加卡片")
    }

    var cardRemover: some View {
        buttonAdjust(by: -1, buttonSymbol: "rectangle.stack.badge.minus.fill", buttonName: "删除卡片")
    }

    func buttonAdjust(by offset: Int, buttonSymbol: String, buttonName: String) -> some View {
        Button(action: {
            cardsCount += offset
            print("\(cardsCount)")
        }, label: {
            Image(systemName: buttonSymbol)
            Text(buttonName).font(.title)
        }).buttonStyle(.bordered).disabled(cardsCount + offset < 1 || cardsCount + offset > emojis.count)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var cardText: String
    var body: some View {
        ZStack {
            let baseRect = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp {
                baseRect.foregroundStyle(.white)
                baseRect.strokeBorder(lineWidth: 2.0)
                Text(cardText).font(.largeTitle)
            } else {
                baseRect
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
