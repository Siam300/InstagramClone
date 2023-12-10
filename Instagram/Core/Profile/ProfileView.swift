//
//  ProfileView.swift
//  Instagram
//
//  Created by Auto on 12/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    //header
                    VStack(spacing: 10){
                        //Pic and Stats
                        HStack(spacing: 10){
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            ComponentsView(value: 1, title: "Posts")
                            
                            ComponentsView(value: 2, title: "Following")
                            
                            ComponentsView(value: 3, title: "Followers")
                        }
                        
                        //name and bio
                        VStack(alignment: .leading, spacing: 4){
                            Text("Siam")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Bio is empty")
                        }
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        //edit profile button
                        Button {
                            
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .frame(width: 360, height: 32)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
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
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color.black)
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
