//
//  CommentsViewModel.swift
//  Instagram
//
//  Created by Auto on 12/16/23.
//

import Firebase

@MainActor
class CommentsViewModel: ObservableObject {
    @Published var comments = [CommentModel]()
    
    private let post: Post
    private let service: CommentService
    
    init(post: Post){
        self.post = post
        self.service = CommentService(postId: post.id)
        
        Task { try await fetchComments() }
    }
    
    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let comment = CommentModel (postOwnerUid: post.ownerUid,
                                    commentText: commentText,
                                    postId: post.id,
                                    timestamp: Timestamp(),
                                    commentOwnerId: uid
        )
        
        try await service.uploadComment(comment)
        try await fetchComments()
        NotificationManager.shared.uploadCommentNotification(toUid: post.ownerUid, post: post)

    }
    
    func fetchComments() async throws {
        self.comments = try await service.fetchComments()
        try await userDataForComments()
    }
    
    private func userDataForComments() async throws {
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let user = try await UserService.fetchUser(withUiD: comment.commentOwnerId)
            comments[i].user = user
        }
    }
}
