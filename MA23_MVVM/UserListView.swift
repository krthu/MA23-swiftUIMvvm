//
//  UserListView.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-16.
//

import SwiftUI
import PhotosUI

struct UserListView: View {
    @StateObject var usersViewModel = UsersViewModel()
    @State var addSheetIsShown = false

    
    var body: some View {
        NavigationStack{
            VStack {
                List(){
                    ForEach(usersViewModel.users){ user in
                        NavigationLink(destination: UserDetailView(user: user)){
                            userRow(user: user)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .navigationBarItems(trailing: Button(action: {
                addSheetIsShown = true
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(.green)
            })
            .sheet(isPresented: $addSheetIsShown, content: {
                addProfileSheet(usersViewModel : usersViewModel, addSheetIsShowen: $addSheetIsShown)
            })
            )
        }
    }
}

struct userRow: View {
    var user: User
    
    var body: some View {
        HStack{
        
                if let imageData = user.imageData,
                   let uiImage = UIImage(data: imageData){
                    
                    //    let uiImage = UIImage(data: user.imageData){
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .scaledToFit()
                        .clipShape(.circle)
                        .padding(.trailing, 10)
                }else{
                    Image(systemName: "brain.filled.head.profile")
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .scaledToFit()
                        .clipShape(.circle)
                        .padding(.trailing, 10)
                        
                }
            
            
          //  Image(systemName: user.profileImage)
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.title)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

struct addProfileSheet: View{
    @ObservedObject var usersViewModel: UsersViewModel
    
    @State var name : String = ""
    @State var email : String = ""
    @Binding var addSheetIsShowen: Bool
    
    
    
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoData: Data?
    
    var body: some View{
        NavigationStack{
            List{
                HStack{
                    Text("Name:")
                    TextField("John Doe", text: $name)
                }
                
                HStack{
                    Text("E-mail")
                    TextField("john@example.com", text: $email)
                        .foregroundColor(.gray)
            
                }
                Section(){
                    
                    if let selectedPhotoData,
                       let uiImage = UIImage(data: selectedPhotoData){
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .clipShape(.circle)
                  
                    }
                               
                    PhotosPicker(selection: $selectedPhoto,
                                 matching: .images,
                                 photoLibrary: .shared()){
                        Label("Add Image", systemImage: "photo")
                            .foregroundColor(.orange)
                    }
                    if selectedPhotoData != nil {
                        Button(role: .destructive){
                            withAnimation{
                                selectedPhoto = nil
                                selectedPhotoData = nil
                                
                            }
                        } label: {
                            Label("Remove Image", systemImage: "xmark")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Add user")
            .task(id: selectedPhoto, {
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                    selectedPhotoData = data
                }
            })
            Button(action: {
                let user = User(name: name, email: email, profileImage: "brain.filled.head.profile", imageData: selectedPhotoData)
               // usersViewModel.users.append(User(name: name, email: email, profileImage: "brain.filled.head.profile", imageData: selectedPhotoData))
                usersViewModel.addUser(user: user)
                addSheetIsShowen = false
                
            }, label: {
                Text("Save")
            })
        }
    }
}

#Preview {
    UserListView()
}
