//
//  PostGridView.swift
//  Instagram
//
//  Created by Auto on 12/12/23.
//

import SwiftUI

struct PostGridView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimention = (UIScreen.main.bounds.width / 3) - 1
    var posts: [Post]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2){
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageDimention, height: imageDimention)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(posts: Post.Mock_Post)
    }
}
