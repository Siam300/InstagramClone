//
//  UserService.swift
//  Instagram
//
//  Created by Auto on 12/13/23.
//

import Foundation
import Firebase

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    
//Mark: - Fetch Data
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        self.currentUser = try await Firestore
            .firestore()
            .collection("users")
            .document(uid)
            .getDocument(as: User.self)
    }
    
    static func fetchUser(withUiD uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
    static func fetchUsers(forConfig config: UserListConfig) async throws -> [User] {
        switch config {
        case .followers(let uid):
            return try await fetchFollowers(uid: uid)
        case .following(let uid):
            return try await fetchFollowing(uid: uid)
        case .likes(let postId):
            return try await fetchPostLikesUsers(postId: postId)
        case .explore:
            return try await fetchAllUsers()
        }
    }
    
    private static func fetchFollowers(uid: String) async throws -> [User] {
        let snapshot = try await FireBaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .getDocuments()
        
        return try await fetchUsers(snapshot)
    }
    
    private static func fetchFollowing(uid: String) async throws -> [User] {
        let snapshot = try await FireBaseConstants
            .FollowingCollection
            .document(uid)
            .collection("user-following")
            .getDocuments()
        
        return try await fetchUsers(snapshot)
    }
    
    private static func fetchPostLikesUsers(postId: String) async throws -> [User] {
        return []
    }
    
    private static func fetchUsers(_ snapshot: QuerySnapshot) async throws -> [User] {
        var users = [User]()
        
        for doc in snapshot.documents {
            users.append(try await fetchUser(withUiD: doc.documentID))
        }
        
        return users
    }
}

//Mark: - Following

extension UserService {
    static func follow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FireBaseConstants
            .FollowingCollection
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .setData([:])
        
        async let _ = try await FireBaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .document(currentUid)
            .setData([:])
    }
    
    static func unfollow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FireBaseConstants
            .FollowingCollection
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .delete()
        
        async let _ = try await FireBaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .document(currentUid)
            .delete()
    }
    
    static func checkIfUserIsFollowed(uid: String) async throws -> Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await FireBaseConstants
            .FollowingCollection
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .getDocument()
        
        return snapshot.exists
    }
}

//Mark: - User Stats

extension UserService {
    static func fetchUserStats(uid: String) async throws -> UserStats {
        async let followingCount = FireBaseConstants
            .FollowingCollection
            .document(uid)
            .collection("user-following")
            .getDocuments()
            .count
        
        async let followerCount = FireBaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .getDocuments()
            .count
        
        async let postsCount = FireBaseConstants
            .PostsCollection
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
            .count
        
        return try await .init(followinCount: followingCount, followersCount: followerCount, postsCount: postsCount)
    }
}
