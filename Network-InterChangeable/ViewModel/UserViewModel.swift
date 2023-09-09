//
//  UserViewModel.swift
//  Network-InterChangeable
//
//  Created by Terry Jason on 2023/9/10.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
//    let webservice = Webservice()
    
    private var service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
}

struct UserViewModel {
    
    let user: User
    
    var id: Int {
        user.id
    }
    
    var name: String {
        user.name
    }
    
    var username: String {
        user.username
    }
    
    var email: String {
        user.email
    }
    
}


// MARK: Networking

extension UserListViewModel {
    
    func downloadUsers() async {
        
        var resource = ""
        
        if service.type == "Webservice" {
            resource = Constants.Urls.usersExtension
        } else {
            resource = Constants.Paths.baseUrl
        }
        
        do {
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
        
    }
    
}
