//
//  SortableBox.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/9/25.
//

import Foundation

struct SortableBox<T> {
    var items: [T]
}

extension SortableBox where T: Comparable {
    mutating func sortItems() {
        items.sort()
    }
}
