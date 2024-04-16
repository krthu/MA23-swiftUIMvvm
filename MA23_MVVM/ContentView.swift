//
//  ContentView.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-15.
//

import SwiftUI

struct ContentView: View {
    @StateObject var usersViewModel = UsersViewModel()
    @State var addSheetIsShown = false
    
    var body: some View {
        NavigationStack{
            VStack {
                List(){
                    ForEach(usersViewModel.users){ user in
                        NavigationLink(destination: UserDetailView()){
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
            Image(systemName: user.profileImage)
            VStack(alignment: .leading){
                Text(user.name)
                Text(user.email)
            }
        }
    }
}

struct addProfileSheet: View{
    @ObservedObject var usersViewModel: UsersViewModel
    @State var name : String = ""
    @State var email : String = ""
    @Binding var addSheetIsShowen: Bool
    
    var body: some View{
        NavigationStack{
            List{
                HStack{
                    Text("Name:")
                    TextField("John Doe", text: $name)
                    
                        
                }
                
                HStack{
                    Text("E-mail")
                    TextField("john.doh@gmail.com", text: $email)
                }
            }
            .navigationTitle("Add user")
            Button(action: {
                usersViewModel.users.append(User(name: name, email: email, profileImage: "brain.filled.head.profile"))
                addSheetIsShowen = false
                
            }, label: {
                Text("Save")
            })
        }
    }
}



#Preview {
    ContentView()
}


