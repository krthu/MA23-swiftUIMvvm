//
//  NoteDetailView.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-17.
//

import SwiftUI


struct NoteDetailView: View {
    var notesVM: NotesViewModel
    var note: Note?
    @State var content: String = ""
    private let dateFormatter = DateFormatter()
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
        NavigationStack{
            VStack{
                TextEditor(text: $content)
            }
            .onAppear(perform: {
                setContent()
            })
            .navigationTitle(note?.date ?? getTodaysDateAsString())
            .navigationBarItems(trailing: Button("Save"){
                saveNote()
            })
        }
    }
    private func setContent(){
        if let note = note{
            content = note.content
        }
    }
    private func getTodaysDateAsString() -> String{
        dateFormatter.dateStyle = .medium
        let todaysDate = dateFormatter.string(from: Date())
        return todaysDate
    }
    
    private func saveNote(){
        if let note = note {
            notesVM.update(note: note, with: content)
        } else{
            notesVM.notes.append(Note(content: content))
        }
        presentationMode.wrappedValue.dismiss()
        
    }
       

}


//#Preview {
//    NoteDetailView()
//}
