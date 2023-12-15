//
//  FeedCell.swift
//  Instagram
//
//  Created by Auto on 12/10/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    private var post: Post {
        return viewModel.post
    }
    
    private var didLike: Bool {
        return post.didLike ?? false
    }
    
    init(post: Post) {
        self.viewModel = FeedCellViewModel(post: post)
    }
    
    var body: some View {
        VStack{
            //image and username
            if let user = post.user {
                HStack{
                    CircularImageProfileView(user: user, size: .xSmall)
                    Text(user.username)
                        .fontWeight(.semibold)
                        .font(.footnote)
                    
                    Spacer()
                }
                .padding(.leading, 4)
            }
            
            
            //Post Image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            //Action buttons
            HStack{
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: didLike ? "heart.fill": "heart")
                        .imageScale(.large)
                        .foregroundColor(didLike ? Color.red : Color.black)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }
                
                Spacer()

            }
            .foregroundColor(Color.black)
            .padding(.top, 4)
            .padding(.leading)
            
            //likes lavel
            Text("\(post.likes) Likes")
                .fontWeight(.semibold)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                
            //caption lavel
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold)
                +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("6h ago")
                .foregroundColor(.gray)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
        }
    }
    
    private func handleLikeTapped() {
        Task {
            if didLike {
                try await viewModel.unLike()
            } else {
                try await viewModel.like()
            }
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.Mock_Post[4])
    }
}
