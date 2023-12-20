//
//  NotificationViewModel.swift
//  Instagram
//
//  Created by Auto on 12/20/23.
//

import Foundation

@MainActor
class NotificationViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    private let service: NotificationService
    
    init(service: NotificationService) {
        self.service = service
        
        Task {
            await fetchNotifications()
        }
    }
    
    func fetchNotifications() async {
        do {
            self.notifications = try await service.fetchNotifications()
            try await updateNotification()
        } catch {
            print("Failed to fetch notifications error code: \(error.localizedDescription)")
        }
    }
    
    private func updateNotification() async throws {
        for i in 0 ..< notifications.count {
            var notification = notifications[i]
            
            notification.user = try await UserService.fetchUser(withUiD: notification.notificationSenderUid)
            
            if let postId = notification.postId {
                notification.post = try await PostService.fetchPost(postId)
            }
            
            notifications[i] = notification
        }
    }
}
