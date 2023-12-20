//
//  NotificationCellView.swift
//  Instagram
//
//  Created by Auto on 12/19/23.
//

import SwiftUI

struct NotificationCellView: View {
    let notification: Notification
    
    var body: some View {
        HStack {
            CircularImageProfileView(size: .xSmall)
            
            //Notification Message
            HStack {
                Text("Username ")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                
                Text("\(notification.type.notificationMessage)")
                    .font(.subheadline) +
                
                Text("3h")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if notification.type != .follow {
                Image("batman")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
                    .clipped()
                    .padding(.leading, 2)
            } else {
                Button {
                    print("Follow button pressed from notification view")
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 88, height: 32)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct NotificationCellView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCellView(notification: DeveloperPreview.shared.notifications[0])
    }
}
