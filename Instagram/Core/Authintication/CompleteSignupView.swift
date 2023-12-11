//
//  CompleteSignupView.swift
//  Instagram
//
//  Created by Auto on 12/11/23.
//

import SwiftUI

struct CompleteSignupView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 12){
            Text("Welcome to Instagram")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Click below to complete registration and start using Instagram.")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            NavigationLink {
                LoginView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Click here to Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 360, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.vertical)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CompleteSignupView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignupView()
    }
}
