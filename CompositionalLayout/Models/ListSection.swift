//
//  ListSection.swift
//  CompositionalLayout
//
//  Created by Saadet Şimşek on 21/09/2024.
//

import Foundation

enum ListSection{
    case sales([ListItem])
    case category([ListItem])
    case example([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .sales(let items):
            return items
        case .category(let items):
            return items
        case .example(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .sales(_):
            return ""
        case .category(_):
            return "Category"
        case .example(_):
            return "Example"
        }
    }
}
