//
//  ProfileView.swift
//  Instagram
//
//  Created by Auto on 12/10/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        ScrollView {
            VStack{
                //header
                VStack(spacing: 10){
                    //Pic and Stats
                    HStack(spacing: 10){
                        Image(user.profileImageUrl ?? "")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        ComponentsView(value: 1, title: "Posts")
                        
                        ComponentsView(value: 2, title: "Following")
                        
                        ComponentsView(value: 3, title: "Followers")
                    }
                    
                    //name and bio
                    VStack(alignment: .leading, spacing: 4){
                        if let fullname = user.fullname {
                            Text(fullname)
                                .fontWeight(.semibold)
                        }
                        if let bio = user.bio {
                            Text(bio)
                        }
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    //edit profile button
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 360, height: 32)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    Divider()
                }
                
                //postgrid
                
                LazyVGrid(columns: gridItems, spacing: 2){
                    ForEach(0 ... 69, id: \.self) { index in
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.Mock_Users[0])
    }
}
