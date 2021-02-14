//
//  Data.swift
//  Memorize
//
//  Created by Дарья on 21.01.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import Foundation

struct Data {
    
    static func getLevels() -> [String] {
        return ["light", "medium", "hard", "superhard"]
    }
    
    static func getCategories(for level: String) -> [Category] {
        switch level {
        case "light":
            return [Category(name: "Hallowen", emojies: ["👻", "🎃", "🕷"]),
                    Category(name: "New Year", emojies: ["🎄", "🎅", "🍾"]),
                    Category(name: "Hearts", emojies: ["💙", "❤️", "🖤"]),
                    Category(name: "Flags", emojies: ["🇮🇳", "🇺🇸", "🇷🇺"]),
                    Category(name: "Food", emojies: ["🍕", "🍪", "🍓"]),
                    Category(name: "Drinks", emojies: ["☕️", "🍹", "🧉"])]
        case "medium":
            return [Category(name: "Hallowen", emojies: ["👻", "🎃", "💀", "🔮", "🧙‍♀️", "🕷"]),
                    Category(name: "New Year", emojies: ["🎄", "🎅", "🎉", "🎊", "🍾", "🤶"]),
                    Category(name: "Hearts", emojies: ["💙", "💚", "💛", "💜", "❤️", "🖤"]),
                    Category(name: "Flags", emojies: ["🇬🇧", "🇩🇪", "🇮🇳", "🇪🇸", "🇺🇸", "🇷🇺"]),
                    Category(name: "Food", emojies: ["🥐", "🍕", "🍰", "🍪", "🍓", "🍱"]),
                    Category(name: "Drinks", emojies: ["☕️", "🍺", "🥂", "🍷", "🍹", "🧉"])]
        case "hard":
            return [Category(name: "Hallowen", emojies: ["👻", "🎃", "💀", "🔮", "🧙‍♀️", "🕷", "😱", "🧛‍♂️", "🧟‍♂️"]),
                    Category(name: "New Year", emojies: ["🎄", "🎅", "🎉", "🎊", "🍾", "🤶", "❄️", "🎁", "🎆"]),
                    Category(name: "Hearts", emojies: ["💙", "💚", "💛", "💜", "❤️", "🖤", "🧡", "💖", "🤎"]),
                    Category(name: "Flags", emojies: ["🇬🇧", "🇩🇪", "🇮🇳", "🇪🇸", "🇺🇸", "🇷🇺", "🇯🇵", "🇹🇷", "🇨🇦"]),
                    Category(name: "Food", emojies: ["🥐", "🍕", "🍰", "🍪", "🍓", "🍱", "🍦", "🥦", "🌭"]),
                    Category(name: "Drinks", emojies: ["☕️", "🍺", "🥂", "🍷", "🍹", "🧉", "🥛", "🧃", "🍸"])]
        case "superhard":
            return [Category(name: "Hallowen", emojies: ["👻", "🎃", "💀", "🔮", "🧙‍♀️", "🕷", "😱", "🧛‍♂️", "🧟‍♂️", "🧝‍♂️", "😳", "🤖"]),
                    Category(name: "New Year", emojies: ["🎄", "🎅", "🎉", "🎊", "🍾", "🤶", "❄️", "🎁", "🎆", "🥳", "☃️", "🕛"]),
                    Category(name: "Hearts", emojies: ["💙", "💚", "💛", "💜", "❤️", "🖤", "🧡", "💖", "🤎", "💖", "❣️", "💕"]),
                    Category(name: "Flags", emojies: ["🇬🇧", "🇩🇪", "🇮🇳", "🇪🇸", "🇺🇸", "🇷🇺", "🇯🇵", "🇹🇷", "🇨🇦", "🇮🇱", "🇨🇳", "🇨🇭"]),
                    Category(name: "Food", emojies: ["🥐", "🍕", "🍰", "🍪", "🍓", "🍱", "🍦", "🥦", "🌭", "🍝", "🥗", "🍗"]),
                    Category(name: "Drinks", emojies: ["☕️", "🍺", "🥂", "🍷", "🍹", "🧉", "🥛", "🧃", "🍸", "🥃", "🍵", "🥤"])]
        default:
            return []
        }
    }
}
