//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Auto on 12/17/23.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func fetchUserStats() {
        guard user.stats == nil else { return }
        Task {
            self.user.stats = try await UserService.fetchUserStats(uid: user.id)
        }
    }
}

//Mark: - Following
extension ProfileViewModel {
    func follow() {
        Task {
            try await UserService.follow(uid: user.id)
            user.isFollowed = true
        }
    }
    
    func unfollow() {
        Task {
            try await UserService.unfollow(uid: user.id)
            user.isFollowed = false
        }
    }
    
    func checkUserIfFollowed() {
        guard user.isFollowed == nil else { return }
        Task {
            self.user.isFollowed = try await UserService.checkIfUserIsFollowed(uid: user.id)
        }
    }
}
