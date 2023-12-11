//
//  ProfileView.swift
//  Instagram
//
//  Created by Auto on 12/10/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var posts: [Post] {
        return Post.Mock_Post.filter({ $0.user?.username == user.username
        })
    }

    var body: some View {
        ScrollView {
            VStack{
                //header
                ProfileHeaderView(user: user)
                
                //postgrid
                
                PostGridView(posts: posts)
                
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
