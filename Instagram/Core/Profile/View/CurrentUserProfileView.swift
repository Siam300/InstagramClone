//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Auto on 12/11/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User

    private let imageDimention = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    //header
                    ProfileHeaderView(user: user)
                    
                    //postgrid
                    
                    PostGridView(user: user)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Text("Log Out")
                        //Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color.black)
                    }
                }
            }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.Mock_Users[0])
    }
}
