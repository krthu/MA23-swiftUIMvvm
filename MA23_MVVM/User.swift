//
//  user.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-15.
//

import Foundation

struct User: Identifiable{
    var id = UUID()
    var name: String
    var email: String
    var profileImage: String
}
