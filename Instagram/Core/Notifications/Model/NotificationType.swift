//
//  NotificationType.swift
//  Instagram
//
//  Created by Auto on 12/20/23.
//

import Foundation

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return "liked your post "
        case .comment: return "commented your post "
        case .follow: return "started following you "
        }
    }
}
