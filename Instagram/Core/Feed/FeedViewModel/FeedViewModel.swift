//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Auto on 12/15/23.
//

import Foundation
import Firebase
import FirebaseAuth

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
        
    }
}
