//
//  noteListView.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-17.
//

import SwiftUI
import SwiftData

struct NoteListView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Note]()
    @Query var notes: [Note]
    
    var body: some View {
        NavigationStack(path: $path){
            List{
                ForEach(notes){ note in
                    NavigationLink(value: note) {

                        noteRow(note: note)
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Notes")
            .navigationDestination(for: Note.self) { note in
                NoteDetailView(note: note)
            }
            .toolbar{
                Button("New Note", systemImage: "plus", action: addNote)
            }
        }
    }
    func addNote() {
        let newNote = Note(content: "")
        modelContext.insert(newNote)
        path.append(newNote)
       
    }
    
    
    func deleteNote(_ indexSet: IndexSet){
        for index in indexSet{
            let note = notes[index]
            modelContext.delete(note)
        }
    }
}

struct noteRow: View {
    let note: Note
    
    var body: some View{
        HStack{
            Text(note.unformatedDate.formatted(date: .long, time: .omitted))
            Spacer()
            Text(note.content.prefix(5)+"...")
        }
    }
}

#Preview {
    NoteListView()
}
