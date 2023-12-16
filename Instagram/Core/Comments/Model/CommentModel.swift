//
//  CommentViewModel.swift
//  Instagram
//
//  Created by Auto on 12/16/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct CommentModel: Identifiable, Codable {
    @DocumentID var commentId: String?
    let postOwnerUid: String
    let commentText: String
    let postId: String
    let timestamp: Timestamp
    let commentOwnerId: String
    
    var user: User?
    
    var id: String {
        return commentId ?? NSUUID().uuidString
    }
}
