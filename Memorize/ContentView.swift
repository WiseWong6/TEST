//
//  ContentView.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/6.
//

import SwiftUI

struct ContentView: View {
    @State var emojisInit: [String] = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🐻‍❄️", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐋", "🐧", "🐦", "🐤", "🐺", "🐡"]
    let allEmojis = [["🫥", "🤠", "😈", "👿", "👹", "👺", "🤡", "👻", "💀", "☠️", "👽", "👾", "🤖", "🎃"],["🚗", "🚕", "🚙", "🚎", "🏎️", "🚌", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛"],["✈️", "🛫", "🛬", "🛩️", "🛰️", "🚀", "🛸", "🚁"]]
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle).bold()
            ScrollView {
                cards
            }
            Spacer()
            buttonsView

        }.padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90.0))], content: {
            ForEach(emojisInit.indices, id: \.self) { _ in
                let randomIndex = Int.random(in: emojisInit.indices)
                CardView(cardText: emojisInit[randomIndex]).aspectRatio(4 / 3, contentMode: .fill)
            }
        }).foregroundColor(.orange)
    }

    var buttonsView: some View {
        HStack(spacing: 20) {
            button1
            button2
            button3
        }
    }

    var button1: some View {
        buttonTheme(themeArray: 0, symbol: "car.rear.fill", txt: "TVehicles")
    }

    var button2: some View {
        buttonTheme(themeArray: 1, symbol: "questionmark.circle.fill", txt: "Theme 2")
    }

    var button3: some View {
        buttonTheme(themeArray: 2, symbol: "questionmark.circle.fill", txt: "Theme 3")
    }

    func buttonTheme(themeArray: Int, symbol: String, txt: String) -> some View {
        Button(action: {
            switchTheme(arrayNum:themeArray)
        }, label: {
            VStack {
                Image(systemName: symbol).font(.largeTitle)
                Text(txt)
            }

        })
    }
    
    func switchTheme(arrayNum:Int){
        emojisInit = allEmojis[arrayNum]
    }
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
