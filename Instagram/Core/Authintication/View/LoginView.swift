//
//  LoginView.swift
//  Instagram
//
//  Created by Auto on 12/11/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var pass = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Spacer()
                
                //instagram logo
                Image("instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                //email, pass, forget pass and login view
                VStack{
                    TextField("Enter email", text: $email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .modifier(IGTextfieldModifier())
                    
                    SecureField("Password", text: $pass)
                        .modifier(IGTextfieldModifier())
                    
                    Button {
                        
                    } label: {
                        Text("Forgot password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.trailing, 28)
                            .padding(.top)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Button {
                        
                    } label: {
                        Text("Login")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 360, height: 44)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.vertical)
                }
                
                //divider
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(Color.gray)
                
                //facebook button
                HStack{
                    Image("facebook")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.blue)
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack{
                        Text("Dont have account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
