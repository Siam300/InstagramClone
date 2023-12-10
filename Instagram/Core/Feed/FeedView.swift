//
//  FeedView.swift
//  Instagram
//
//  Created by Auto on 12/10/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 32){
                    ForEach(0 ... 10, id: \.self) { posts in
                        FeedCell()
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        
                    } label: {
                        Image(systemName: "instagram")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 32)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
