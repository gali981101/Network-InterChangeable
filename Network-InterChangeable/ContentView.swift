//
//  ContentView.swift
//  Network-InterChangeable
//
//  Created by Terry Jason on 2023/9/10.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel: UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: Localservice())
    }
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) { user in
            VStack {
                Text(user.name)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
