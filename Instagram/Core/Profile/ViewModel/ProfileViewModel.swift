//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Auto on 12/17/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}

//Mark Following
extension ProfileViewModel {
    func follow() {
        user.isFollowed = true
    }
    
    func unfollow() {
        user.isFollowed = false
    }
    
    func checkUserIfFollowed() {
        
    }
}
