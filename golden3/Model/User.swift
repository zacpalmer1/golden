//
//  User.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 11/18/22.
//


//This is the User Object!

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
