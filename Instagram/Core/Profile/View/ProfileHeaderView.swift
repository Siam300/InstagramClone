//
//  ProfileHeaderVIew.swift
//  Instagram
//
//  Created by Auto on 12/12/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State var showEditProfile = false
    
    private var user: User {
        return viewModel.user
    }
    
    private var isFollowed: Bool {
        return user.isFollowed ?? false
    }
    
    private var buttonTitle: String {
        if user.iscurrentUser {
            return "Edit Profile"
        } else {
            return isFollowed ? "Following" : "Follow"
        }
    }
    
    private var buttonBackgroundColor: Color {
        if user.iscurrentUser || isFollowed {
            return Color.white
        } else {
            return Color(.systemBlue)
        }
    }
    
    private var buttonForegroundColor: Color {
        if user.iscurrentUser || isFollowed {
            return Color.black
        } else {
            return Color(.white)
        }
    }
    
    private var buttonBorderColor: Color {
        if user.iscurrentUser || isFollowed {
            return Color.gray
        } else {
            return .clear
        }
    }
    
    private var stats: UserStats {
        return user.stats ?? .init(followinCount: 0, followersCount: 0, postsCount: 0)
    }
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(spacing: 10){
            //Pic and Stats
            HStack(spacing: 10){
                CircularImageProfileView(user: user, size: .large)
                
                Spacer()
                
                HStack {
                    ComponentsView(value: stats.postsCount, title: "Posts")
                    
                    NavigationLink(value: UserListConfig.followers(uid: user.id)) {
                        ComponentsView(value: stats.followersCount, title: "Followers")
                    }
                    
                    NavigationLink(value: UserListConfig.following(uid: user.id)){
                        ComponentsView(value: stats.followinCount, title: "Following")
                    }
                }
            }
            .padding(.horizontal)
            
            //name and bio
            VStack(alignment: .leading, spacing: 4){
                Text(user.username)
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
                if user.iscurrentUser {
                    showEditProfile.toggle()
                } else {
                    handleFollowTapped()
                }
            } label: {
                Text(buttonTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(buttonBackgroundColor)
                    .foregroundColor(buttonForegroundColor)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(buttonBorderColor, lineWidth: 1)
                    }
            }
            Divider()
        }
        .navigationDestination(for: UserListConfig.self, destination: { config in
            UserListView(config: config)
        })
        .onAppear {
            viewModel.checkUserIfFollowed()
            viewModel.fetchUserStats()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfleView(user: user)
        }
    }
    
    func handleFollowTapped() {
        if isFollowed {
            viewModel.unfollow()
        } else {
            viewModel.follow()
        }
    }
}

struct ProfileHeaderVIew_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.Mock_Users[0])
    }
}
