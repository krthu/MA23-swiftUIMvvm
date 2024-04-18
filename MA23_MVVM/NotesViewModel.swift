//
//  NotesViewModel.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-17.
//

//import Foundation
//
//
//class NotesViewModel : ObservableObject{
//    @Published var notes: [Note] = []
//    
//    
//    
//    
//    init(){
//        //addMockData()
//    }
//    
//    
////    func addMockData(){
////        notes.append(Note(content: "Smurf"))
////        notes.append(Note( content: "Halloj"))
////        notes.append(Note( content: "Hej då"))
////    }
//    
//    func update(note: Note, with content: String){
//        if let index = notes.firstIndex(of: note){
//            notes[index].content = content
//        }
//    }
//    
//    func deleteNote(atIndex offSets: IndexSet){
//        notes.remove(atOffsets: offSets)
//    }
//    
//}
