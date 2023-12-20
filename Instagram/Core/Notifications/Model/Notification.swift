//
//  Notification.swift
//  Instagram
//
//  Created by Auto on 12/20/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Notification: Identifiable, Codable { 
    let id: String
    var postId: String?
    let timestamp: Timestamp
    let notificationSenderUid: String
    let type: NotificationType
    
    var post: Post?
    var user: User?
}
