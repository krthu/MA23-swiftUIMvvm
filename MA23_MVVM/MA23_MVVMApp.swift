//
//  MA23_MVVMApp.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-15.
//

import SwiftUI
import SwiftData

@main
struct MA23_MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
