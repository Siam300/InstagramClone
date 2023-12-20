//
//  NotificationView.swift
//  Instagram
//
//  Created by Auto on 12/19/23.
//

import SwiftUI

struct NotificationView: View {
    @StateObject var viewModel = NotificationViewModel(service: NotificationService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.notifications) { notification in
                        NotificationCellView(notification: notification)
                            .padding(.top)
                    }
                }
            }
            .navigationDestination(for: Post.self, destination: { post  in
                FeedCell(post: post)
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationBarTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
