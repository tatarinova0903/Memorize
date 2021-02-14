//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Дарья on 21.01.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func index(of item: Element) -> Int? {
        for index in 0..<self.count {
            if item.id == self[index].id {
                return index
            }
        }
        return nil
    }

}
