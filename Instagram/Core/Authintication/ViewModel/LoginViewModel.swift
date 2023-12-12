//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Auto on 12/13/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withemail: email, password: password)
    }
}
