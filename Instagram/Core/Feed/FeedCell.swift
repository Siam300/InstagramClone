//
//  FeedCell.swift
//  Instagram
//
//  Created by Auto on 12/10/23.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack{
            //image and username
            if let user = post.user {
                HStack{
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text(user.username)
                        .fontWeight(.semibold)
                        .font(.footnote)
                    
                    Spacer()
                }
                .padding(.leading, 4)
            }
            
            
            //Post Image
            Image(post.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            //Action buttons
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "heart")
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
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.Mock_Post[4])
    }
}
