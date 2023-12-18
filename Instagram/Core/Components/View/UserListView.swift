//
//  UserListView.swift
//  Instagram
//
//  Created by Auto on 12/18/23.
//

import SwiftUI

struct UserListView: View {
    @State private var searchText = ""
    @StateObject var viewModel = UserListViewModel()
    
    private let config: UserListConfig
    
    init (config: UserListConfig) {
        self.config = config
    }
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.users){ user in
                NavigationLink(value: user) {
                    HStack{
                        CircularImageProfileView(user: user, size: .xSmall)
                        
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
        .task {
            await viewModel.fetchUsers(forConfig: config)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(config: .explore)
    }
}
