//
//  NotificationCellView.swift
//  Instagram
//
//  Created by Auto on 12/19/23.
//

import SwiftUI

struct NotificationCellView: View {
    var body: some View {
        HStack {
            CircularImageProfileView(size: .xSmall)
            
            //Notification Message
            HStack {
                Text("Username ")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                
                Text("Liked your post. ")
                    .font(.subheadline) +
                
                Text("3h")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image("batman")
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFill()
                .clipped()
                .padding(.leading, 2)
        }
    }
}

struct NotificationCellView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCellView()
    }
}
