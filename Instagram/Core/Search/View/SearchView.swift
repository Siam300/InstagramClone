//
//  SearchView.swift
//  Instagram
//
//  Created by Auto on 12/11/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                ForEach(viewModel.users){ user in
                    NavigationLink(value: user) {
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
                        .foregroundColor(Color.black)
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
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
