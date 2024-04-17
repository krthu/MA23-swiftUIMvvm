//
//  noteListView.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-17.
//

import SwiftUI


struct NoteListView: View {
    
    @StateObject var notesViewModel = NotesViewModel()

    
    var body: some View {
        NavigationStack{
            List{
                ForEach(notesViewModel.notes){ note in
                    NavigationLink(destination: NoteDetailView(notesVM: notesViewModel ,note: note)){
                        noteRow(note: note)
                    }
                }
                .onDelete(perform: notesViewModel.deleteNote)
            }
  
            .navigationTitle("Notes")
            .navigationBarItems(trailing: NavigationLink(destination: NoteDetailView(notesVM: notesViewModel)){
                Image(systemName: "plus")
                    
            })

        }
    }
    func delete(at offsetes: IndexSet){
        print("delete")
    }
}

struct noteRow: View {
    let note: Note
    
    var body: some View{
        HStack{
            Text(note.date)
            Spacer()
            Text(note.content.prefix(5)+"...")
        }
    }
}

#Preview {
    NoteListView()
}
