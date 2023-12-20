//
//  NotificationService.swift
//  Instagram
//
//  Created by Auto on 12/20/23.
//

import Firebase
import FirebaseFirestore

class NotificationService {
    func fetchNotifications() async throws -> [Notification]{
        return DeveloperPreview.shared.notifications
    }
    
    func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        let ref = FireBaseConstants
            .NotificationCollection
            .document(uid)
            .collection("user-notification")
            .document()
        
        let notification = Notification(id: ref.documentID,
                                        timestamp: Timestamp(),
                                        notificationSenderUid: currentUid,
                                        type: type)
        
        guard let notificationData = try? Firestore.Encoder().encode(notification) else { return }
        
        ref.setData(notificationData)
    }
    
    func deleteNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        
    }
}
