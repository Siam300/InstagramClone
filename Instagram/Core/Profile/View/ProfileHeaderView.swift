//
//  ProfileHeaderVIew.swift
//  Instagram
//
//  Created by Auto on 12/12/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State var showEditProfile = false
    
    var body: some View {
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
                Text(user.username)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            //edit profile button
            Button {
                if user.iscurrentUser {
                    showEditProfile.toggle()
                } else {
                    
                }
            } label: {
                Text(user.iscurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.iscurrentUser ? Color.white : Color.blue)
                    .foregroundColor(user.iscurrentUser ? Color.black : Color.white)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.iscurrentUser ? Color.gray : .clear, lineWidth: 1)
                    }
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            Text("Edit Profile")
        }
    }
}

struct ProfileHeaderVIew_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.Mock_Users[0])
    }
}
