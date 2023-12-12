//
//  AuthService.swift
//  Instagram
//
//  Created by Auto on 12/12/23.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withemail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        
    }
}
