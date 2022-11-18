//
//  UserService.swift
//  golden3
//
//  Created by Laws, Matt (Student) on 11/8/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService{
    func fetchUser( withUId uid: String, completion: @escaping(User) -> Void ){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument{snapshot, _ in
                guard let snapshot = snapshot else {return}
                // print("DEBUG: Fetched - User Data Is: \(snapshot)")

                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
                print("DEBUG: Fetching user ...")
                print("DEBUG: Username is: < \(user.username) >")
                print("DEBUG: Full name is: < \(user.fullname) >")
                print("DEBUG: Email is: < \(user.email) >")


            }
    }
}
