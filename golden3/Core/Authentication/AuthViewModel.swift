//
//  AuthViewModel.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 10/24/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return}
        service.fetchUser(withUId: uid)
        
    }
}
