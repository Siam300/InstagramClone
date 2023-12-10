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
                ForEach(0 ... 20, id: \.self){ user in
                    HStack{
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        VStack(spacing: 8) {
                            Text("Person")
                                .fontWeight(.semibold)
                            Text("This is bio")
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
