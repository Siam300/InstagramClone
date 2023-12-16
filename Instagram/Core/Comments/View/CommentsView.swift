//
//  CommentsView.swift
//  Instagram
//
//  Created by Auto on 12/16/23.
//

import SwiftUI

struct CommentsView: View {
    @State private var commentText = ""
    @StateObject var viewModel: CommentsViewModel
    
    
    init(post: Post) {
        self._viewModel = StateObject(wrappedValue: CommentsViewModel(post: post))
    }
    
    var body: some View {
        VStack {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 24)
            
            Divider()
            
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentCellView(comment: comment)
                    }
                }
            }
            .padding(.top)
            
            Divider()
            
            HStack(spacing: 12) {
                CircularImageProfileView(user: User.Mock_Users[0], size: .xSmall)
                
                ZStack(alignment: .trailing) {
                    TextField("Add comment...", text: $commentText, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 40)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray5), lineWidth: 1)
                        }
                    Button {
                        Task {
                            try await viewModel.uploadComment(commentText: commentText)
                            commentText = ""
                        }
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(12)
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(post: Post.Mock_Post[0])
    }
}
