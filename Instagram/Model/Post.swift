//
//  Post.swift
//  Instagram
//
//  Created by Auto on 12/12/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timeStrap: Timestamp
    var user: User?
}

extension Post {
    static var Mock_Post: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Dark Knight",
            likes: 2456,
            imageUrl: "batman",
            timeStrap: Timestamp(),
            user: User.Mock_Users[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Strongest man alive",
            likes: 1348,
            imageUrl: "superman",
            timeStrap: Timestamp(),
            user: User.Mock_Users[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Friendly Neighberhood Spiderman",
            likes: 2349,
            imageUrl: "spiderman",
            timeStrap: Timestamp(),
            user: User.Mock_Users[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I am the king of ocean",
            likes: 678,
            imageUrl: "aquaman",
            timeStrap: Timestamp(),
            user: User.Mock_Users[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I am iron man",
            likes: 79,
            imageUrl: "ironman",
            timeStrap: Timestamp(),
            user: User.Mock_Users[4]
        ),
        
    ]
}
