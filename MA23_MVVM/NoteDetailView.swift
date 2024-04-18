//
//  NoteDetailView.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-17.
//

import SwiftUI

struct NoteDetailView: View {

    @Bindable var note: Note
    var body: some View {

            VStack{
                TextEditor(text: $note.content)
            }
            .navigationTitle(note.unformatedDate.formatted(date: .long, time: .omitted))
            .navigationBarTitleDisplayMode(.inline)
        
    }
}


//#Preview {
//    NoteDetailView()
//}
