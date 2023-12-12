//
//  PasswordView.swift
//  Instagram
//
//  Created by Auto on 12/11/23.
//

import SwiftUI

struct PasswordView: View {
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12){
            Text("Create password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Pick a strong password for your account. Your password must be at least 6 character length.")
                .font(.footnote)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .modifier(IGTextfieldModifier())
            
            NavigationLink {
                CompleteSignupView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 360, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
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

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}
