//
//  PostService.swift
//  Instagram
//
//  Created by Auto on 12/15/23.
//

import Firebase

struct PostService {
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUiD: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
    }
    
    static func fetchPost(_ postId: String) async throws -> Post {
        return try await FireBaseConstants
            .PostsCollection
            .document(postId)
            .getDocument(as: Post.self)
    }
}

// Mark -> Likes

extension PostService {
    static func likePosts(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await postCollection.document(post.id).collection("post-likes").document(uid).setData([:])
        async let _ = try await postCollection.document(post.id).updateData(["likes": post.likes + 1])
        async let _ = try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(post.id).setData([:])
    }
    
    static func unlikePosts(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await postCollection.document(post.id).collection("post-likes").document(uid).delete()
        async let _ = try await postCollection.document(post.id).updateData(["likes": post.likes - 1])
        async let _ = try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(post.id).delete()
    }
    
    static func checkIfuserLikedPost(_ post: Post) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(post.id).getDocument()
        
        return snapshot.exists
    }
}
