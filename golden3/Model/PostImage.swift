//
//  Post.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 11/29/22.
//


import FirebaseFirestoreSwift

struct PostImage: Identifiable, Decodable {
    @DocumentID var id: String?
    let uid: String
    let postImageUrl: String
    let date_uploaded: String
}
