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
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
}
