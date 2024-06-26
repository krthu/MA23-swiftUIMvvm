//
//  ContentView.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        TabView {
            UserListView()
                .tabItem {
                    Label("Users", systemImage: "person")
                }
            CurrencyConverterView()
                .tabItem {
                    Label("Converter", systemImage: "dollarsign.circle.fill")
                }
            NoteListView()
                .tabItem {
                    Label("Notes", systemImage: "list.bullet.clipboard")
                }
        }
    }
}



#Preview {
    ContentView()
}


