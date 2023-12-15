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
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) }) 

        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUiD: ownerUid)
            posts[i].user = postUser
        }
    }
}
