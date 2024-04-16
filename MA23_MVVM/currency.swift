//
//  currency.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-16.
//

import Foundation

struct Currency : Identifiable{
    var id = UUID()
    var name: String
    var rate: Double
    
}
