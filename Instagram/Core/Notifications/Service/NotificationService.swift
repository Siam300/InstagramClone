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
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        
        let snapshot = try await FireBaseConstants
            .UserNotificationCollection(uid: currentUid)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Notification.self) }) 
    }
    
    func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        let ref = FireBaseConstants
            .NotificationCollection
            .document(uid)
            .collection("user-notifications")
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
