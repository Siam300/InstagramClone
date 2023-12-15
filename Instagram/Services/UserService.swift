//
//  UserService.swift
//  Instagram
//
//  Created by Auto on 12/13/23.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchUser(withUiD uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
