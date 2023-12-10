//
//  FeedCell.swift
//  Instagram
//
//  Created by Auto on 12/10/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            //image and username
            HStack{
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("Person")
                    .fontWeight(.semibold)
                    .font(.footnote)
                
                Spacer()
            }
            .padding(.leading, 4)
            
            //Post Image
            Image(systemName: "car.fill")
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
            Text("20 Likes")
                .fontWeight(.semibold)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                
            //caption lavel
            HStack {
                Text("Person ") .fontWeight(.semibold)
                +
                Text("This is a dummy Caption")
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
        FeedCell()
    }
}
