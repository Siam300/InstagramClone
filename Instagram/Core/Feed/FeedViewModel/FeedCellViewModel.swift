//
//  FeedCellViewModel.swift
//  Instagram
//
//  Created by Auto on 12/15/23.
//

import Foundation

@MainActor
class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        Task { try await checkIfUserLikedPost() }
    }
    
    func like() async throws {
        do {
            let tempPost = post
            post.didLike = true
            post.likes += 1
            try await PostService.likePosts(tempPost)
        } catch {
            post.didLike = false
            post.likes += 1
        }
    }
    
    func unLike() async throws {
        do {
            let tempPost = post
            post.didLike = false
            post.likes -= 1
            try await PostService.unlikePosts(tempPost)
        } catch {
            post.didLike = true
            post.likes += 1
        }
    }
    
    func checkIfUserLikedPost() async throws {
        self.post.didLike = try await PostService.checkIfuserLikedPost(post)
    }
}
