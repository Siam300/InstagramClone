//
//  CommentCellView.swift
//  Instagram
//
//  Created by Auto on 12/16/23.
//

import SwiftUI

struct CommentCellView: View {
    let comment: CommentModel
    private var user: User? {
        return comment.user
    }
    
    var body: some View {
        HStack {
            CircularImageProfileView(user: user, size: .xSmall)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(user?.username ?? "")
                        .fontWeight(.semibold)
                    Text("2d ")
                        .foregroundColor(Color.gray)
                }
                Text(comment.commentText)
            }
            .font(.caption)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}
//
//struct CommentCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCellView()
//    }
//}
