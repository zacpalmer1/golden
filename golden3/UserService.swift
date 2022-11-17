//
//  UserService.swift
//  golden3
//
//  Created by Laws, Matt (Student) on 11/8/22.
//

import Firebase

struct UserService{
    func fetchUser(withUId uid: String){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument{snapshot, _ in
                guard let data = snapshot?.data() else {return}
                print("Debug: Fetched - User Data Is: \(data)")
            }
    }
}
