//
//  ContentView.swift
//  Memorize
//
//  Created by Дарья on 21.01.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedLevel = 0 // TODO: запоминать в памяти телефона
    @State private var showSettings = false
    
    var body: some View {
        let categories = Data.getCategories(for: Data.getLevels()[selectedLevel])
        return NavigationView {
            List(categories) { category in
                NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(emojies: category.emojies))) {
                    CategoryRow(category: category)
                }
            }
            .navigationBarTitle("Memorize")
            .navigationBarItems(trailing: Button(action: {
                self.showSettings.toggle()
            }, label: {
                Text("Уровень сложности")
            })
                .sheet(isPresented: $showSettings, content: {
                    SettingsView(selectedLevel: self.$selectedLevel)
                }))
        }
    }
}

struct Category: Identifiable {
    var id = UUID()
    var name: String
    var emojies: Array<String>
}

struct CategoryRow: View {
    var category: Category
    
    var body: some View {
        VStack {
            HStack {
                Text(category.name)
                Spacer()
            }
            HStack {
                ForEach(category.emojies, id: \.self) { emoji in
                    Text(emoji)
                }
                Spacer()
            }
        }
    }
}

struct SettingsView: View {
    @Binding var selectedLevel: Int
    let levels = Data.getLevels()
    var body: some View {
        VStack {
            Picker(selection: $selectedLevel, label: Text("Levels"), content: {
                ForEach(0..<levels.count) { Text(self.levels[$0]) }
            })
                .pickerStyle(SegmentedPickerStyle())
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
