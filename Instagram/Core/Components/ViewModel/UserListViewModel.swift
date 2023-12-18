//
//  UserListViewModel.swift
//  Instagram
//
//  Created by Auto on 12/18/23.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        
    }
    
    func fetchUsers(forConfig config: UserListConfig) async {
        do {
            self.users = try await UserService.fetchUsers(forConfig: config)
        } catch {
            print("failed to fetch error: \(error.localizedDescription)")
        }
    }
}
