//
//  ContentView.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/6.
//

import SwiftUI

struct ContentView: View {
    let animalsEmojis = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🐻‍❄️", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐋", "🐧", "🐦", "🐤", "🐺", "🐡"]
    let halloweenEmojis = ["🫥", "🤠", "😈", "👿", "👹", "👺", "🤡", "👻", "💀", "☠️", "👽", "👾", "🤖", "🎃"]
    let carEmojis = ["🚗", "🚕", "🚙", "🚎", "🏎️", "🚌", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛"]
    let flyerEmojis = ["✈️", "🛫", "🛬", "🛩️", "🛰️", "🚀", "🛸", "🚁"]
    @State var emojisInit: [String] = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🐻‍❄️", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐋", "🐧", "🐦", "🐤", "🐺", "🐡"]
    @State private var cardsCount = 4
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle).bold()
            ScrollView {
                cards
            }
            Spacer()
            HStack(spacing: 20) {
                Button(action: {
                    emojisInit = carEmojis
                }, label: {
                    VStack {
                        Image(systemName: "car.rear.fill").font(.largeTitle)
                        Text("Vehicles")
                    }

                })
                Button(action: {
                    emojisInit = halloweenEmojis
                }, label: {
                    VStack {
                        Image(systemName: "questionmark.circle.fill").font(.largeTitle)
                        Text("Theme 2")
                    }

                })
                Button(action: {
                    emojisInit = flyerEmojis
                }, label: {
                    VStack {
                        Image(systemName: "questionmark.circle.fill").font(.largeTitle)
                        Text("Theme 3")
                    }

                })
            }

        }.padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120.0))], content: {
            ForEach(0 ..< cardsCount, id: \.self) { _ in
                let randomIndex = Int.random(in: 0 ..< emojisInit.count)
                CardView(cardText: emojisInit[randomIndex]).aspectRatio(4 / 3, contentMode: .fill)
            }
        }).foregroundColor(.orange)
    }

//    var buttonView: some View {
//        HStack {
//            cardAdder
//            Spacer()
//            cardRemover
//        }
//    }
//
//    var cardAdder: some View {
//        buttonAdjust(by: 1, buttonSymbol: "rectangle.stack.badge.plus.fill", buttonName: "添加卡片")
//    }
//
//    var cardRemover: some View {
//        buttonAdjust(by: -1, buttonSymbol: "rectangle.stack.badge.minus.fill", buttonName: "删除卡片")
//    }
//
//    func buttonAdjust(by offset: Int, buttonSymbol: String, buttonName: String) -> some View {
//        Button(action: {
//            cardsCount += offset
//            print("\(cardsCount)")
//        }, label: {
//            Image(systemName: buttonSymbol)
//            Text(buttonName).font(.title)
//        }).buttonStyle(.bordered).disabled(cardsCount + offset < 1 || cardsCount + offset > emojis.count)
//    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
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
