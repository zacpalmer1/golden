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
    @Published var currentUser: User?
    
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
        //print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    // Login function
    func login(withEmail email: String, withPassword password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: Did log user in")
            
            
        }
    }
    
    // Register function
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user
            //self.userSession = user
            
            
            // Data dictionary
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            print("DEBUG: Data - \(data)")
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { error in
                    if let error = error {
                        print("DEBUG Registration Failed \(error.localizedDescription)")
                    }
                    print("DEBUG: Registration Successful")
                }
        }
    }
    
    // signout user
    func signOut() {
        // signs user out on device
        userSession = nil
        // signs user out on firebase
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { error in
                    if let error = error {
                        print("DEBUG: Failed to upload profileImageUrl with error \(error.localizedDescription)")
                        return
                    }
                    self.userSession = self.tempUserSession
                }
        }
    }
    
    
    
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return}
        service.fetchUser(withUId: uid) { User in
            self.currentUser = User
        }
    }
}
