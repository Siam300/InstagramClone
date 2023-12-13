//
//  ProfileHeaderVIew.swift
//  Instagram
//
//  Created by Auto on 12/12/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
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
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(Color.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
            Divider()
        }
    }
}

struct ProfileHeaderVIew_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.Mock_Users[0])
    }
}
