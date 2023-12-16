//
//  CommentService.swift
//  Instagram
//
//  Created by Auto on 12/16/23.
//

import FirebaseFirestoreSwift
import Firebase

struct CommentService {
    let postId: String
    
    func uploadComment(_ comment: CommentModel) async throws {
        
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        
        try await Firestore
            .firestore()
            .collection("posts")
            .document(postId)
            .collection("post-comment")
            .addDocument(data: commentData) //error: Result of call to 'addDocument(data:)' is unused
    }
    
    func fetchComments() async throws -> [CommentModel] {
        let snapshot = try await Firestore.firestore()
            .collection("posts")
            .document(postId)
            .collection("post-comment")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap { try? $0.data(as: CommentModel.self) }
    }
}
