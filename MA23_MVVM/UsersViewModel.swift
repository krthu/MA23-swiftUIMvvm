//
//  UsersViewModel.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-15.
//

import Foundation

class UsersViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        addMockData()
    }
    
    func addMockData(){
        users.append(User(name: "Kristian", email: "kristian@kristian.com", profileImage: "brain.filled.head.profile"))
        users.append(User(name: "Olle", email: "olle@olle.com", profileImage: "brain.filled.head.profile"))
        users.append(User(name: "Björn", email: "björn@björn.com", profileImage: "brain.filled.head.profile"))

    }
}
