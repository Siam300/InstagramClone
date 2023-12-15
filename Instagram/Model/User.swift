//
//  User.swift
//  Instagram
//
//  Created by Auto on 12/11/23.
//

import Foundation
import Firebase
import FirebaseAuth

struct User: Identifiable, Hashable, Codable {
    let id: String
    let email: String
    var username: String
    var fullname: String?
    var profileImageUrl: String?
    var bio: String?
    
    var iscurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var Mock_Users: [User] = [
        .init(id: NSUUID().uuidString, email: "batman@gmail.com", username: "batman", fullname: "Bruce Wayne", profileImageUrl: nil, bio: "Gotham Knight"),
        .init(id: NSUUID().uuidString, email: "superman@gmail.com", username: "superman", fullname: "Clark Kent", profileImageUrl: nil, bio: "I am strong"),
        .init(id: NSUUID().uuidString, email: "spiderman@gmail.com", username: "spiderman", fullname: "Peter Parker", profileImageUrl: nil, bio: "Friendly Neighborhood spiderman"),
        .init(id: NSUUID().uuidString, email: "aquaman@gmail.com", username: "aquaman", fullname: "Arthur Curry", profileImageUrl: nil, bio: "I am the king of ocean"),
        .init(id: NSUUID().uuidString, email: "ironman@gmail.com", username: "ironman", fullname: "Tony Stark", profileImageUrl: nil, bio: "I am iron man")
        
    ]
}
