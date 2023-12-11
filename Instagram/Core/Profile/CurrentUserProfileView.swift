//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Auto on 12/11/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    var posts: [Post] {
        return Post.Mock_Post.filter({ $0.user?.username == user.username
        })
    }
    private let imageDimention = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        NavigationStack {
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

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.Mock_Users[0])
    }
}
