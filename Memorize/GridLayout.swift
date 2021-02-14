//
//  GridLayout.swift
//  Memorize
//
//  Created by Дарья on 21.01.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import SwiftUI

struct GridLayout {
    private(set) var size: CGSize
    private(set) var rowCount: Int
    private(set) var columnCount: Int
    
    var itemSize: CGSize {
        let width = size.width / CGFloat(columnCount)
        let height = size.height / CGFloat(rowCount)
        return CGSize(width: width, height: height)
    }
    
    init(itemCount: Int, in size: CGSize) {
        self.size = size
        if size.width < size.height {
            rowCount = itemCount / 3
            columnCount = 3
        } else {
            rowCount = itemCount / 6
            columnCount = 6
        }
    }
    
    func location(ofItemAt index: Int) -> CGPoint {
        let indexRow = index / columnCount
        let indexColumn = index % columnCount
        let coordX: CGFloat = itemSize.width * CGFloat(indexColumn) + itemSize.width / 2
        let coordY: CGFloat = itemSize.height * CGFloat(indexRow) + itemSize.height / 2
        return CGPoint(x: coordX, y: coordY)
    }
    
}


