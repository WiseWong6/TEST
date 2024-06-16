//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Wise Wong on 2024/6/16.
//

import Foundation

class MemoryGameModel :ObservableObject{
    // 这是一个 Model，Model 负责处理数据和逻辑，
    // 卡片游戏数据：需要卡片、卡片主题,卡片里面有多个参数，要用 struct
    // 卡片游戏逻辑：主题选择，点击切换视图

    var emojisInit = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐼", "🐻‍❄️", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐋", "🐧", "🐦", "🐤", "🐺", "🐡"]
    let allEmojis = [
        ["🫥", "🤠", "😈", "👿", "👹", "👺", "🤡", "👻", "💀", "☠️", "👽", "👾", "🤖", "🎃"],
        ["🚗", "🚕", "🚙", "🚎", "🏎️", "🚌", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛"],
        ["✈️", "🛫", "🛬", "🛩️", "🛰️", "🚀", "🛸", "🚁"]
    ]

     func switchTheme(index: Int) {
        emojisInit = allEmojis[index]
    }
}
