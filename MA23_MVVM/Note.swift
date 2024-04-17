//
//  Note.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-17.
//

import Foundation
import SwiftData

@Model
class Note: Identifiable{
    let id = UUID()
    var content: String
    var unformatedDate: Date
    init(content: String) {
        self.content = content
        self.unformatedDate = .now
    }
}
