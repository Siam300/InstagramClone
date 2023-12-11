//
//  SearchView.swift
//  Instagram
//
//  Created by Auto on 12/11/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView{
                ForEach(User.Mock_Users){ user in
                    HStack{
                        Image(user.profileImageUrl ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(user.username)
                                .fontWeight(.semibold)
                            Text(user.fullname ?? "")
                        }
                        .font(.footnote)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
