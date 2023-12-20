//
//  NotificationViewModel.swift
//  Instagram
//
//  Created by Auto on 12/20/23.
//

import Foundation

class NotificationViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        self.notifications = DeveloperPreview.shared.notifications
    }
}
