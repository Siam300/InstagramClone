//
//  NotificationManager.swift
//  Instagram
//
//  Created by Auto on 12/20/23.
//

import Foundation

class NotificationManager {
    static let shared = NotificationManager()
    private let service = NotificationService()
    
    private init() { }
    
    func uploadLikeNotification(toUid uid: String, post: Post) {
        service.uploadNotification(toUid: uid, type: .like, post: post)
    }
    
    func uploadCommentNotification(toUid uid: String, post: Post) {
        service.uploadNotification(toUid: uid, type: .comment, post: post)
    }
    
    func uploadFollowNotification(toUid uid: String) {
        service.uploadNotification(toUid: uid, type: .follow)
    }
}
