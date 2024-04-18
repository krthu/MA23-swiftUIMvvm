//
//  UserDetailView.swift
//  MA23_MVVM
//
//  Created by Kristian Thun on 2024-04-15.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                if let imageData = user.imageData,
                   let uiImage = UIImage(data: imageData){
                    
                    //    let uiImage = UIImage(data: user.imageData){
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .scaledToFit()
                        .cornerRadius(50)
                }else{
                    Image(systemName: "brain.filled.head.profile")
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .scaledToFit()
                        .cornerRadius(50)
                        
                }
            

            
          
            Text("\(user.name)")
                .font(.largeTitle)
                .fontWeight(.bold)
             
                
                
                

            Text("\(user.email)")
                .frame(width: .infinity)
                .font(.headline)
                .foregroundColor(.secondary)
                
                
            
               
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 50)
            .padding(.horizontal, 40)
            .background(Material.regular)
            .cornerRadius(10)
      
           
            
            

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(LinearGradient(colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
   
       

      

    }
}

#Preview {
    UserDetailView(user: User(name: "Test", email: "test@Test.com", profileImage: "plus"))
}
