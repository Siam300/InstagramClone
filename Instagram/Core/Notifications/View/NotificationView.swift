//
//  NotificationView.swift
//  Instagram
//
//  Created by Auto on 12/19/23.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(0 ..< 20) { notifications in
                        NotificationCellView()
                            .padding(.top)
                    }
                }
            }
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
