//
//  Note.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-17.
//

import Foundation
import SwiftData

@Model
struct Note: Identifiable, Equatable{
    let id = UUID()
    var content: String
    private var unformatedDate = Date()
    private let dateFormatter = DateFormatter()
    var date: String {
        return dateFormatter.string(from: unformatedDate)
    }
    
    init(content: String) {
        self.content = content
        dateFormatter.dateStyle = .medium
    }
    
    
}
