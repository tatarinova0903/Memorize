//
//  Grid.swift
//  Memorize
//
//  Created by Дарья on 20.01.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
    
    private var items: [Item]
    private var content: (Item) -> ItemView
    
    init(_ items: [Item], content: @escaping (Item) -> ItemView) {
        self.items = items
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    private func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.index(of: item)
        return content(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index!))
    }
    
}
