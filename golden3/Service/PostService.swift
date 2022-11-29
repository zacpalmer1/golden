//
//  PostService.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 11/29/22.
//

import Firebase
import FirebaseFirestoreSwift

struct PostService{
    func fetchPost( withUId uid: String, completion: @escaping(PostImage) -> Void ){
        print("DEBUG: fetchpost function")
        Firestore.firestore().collection("posts")
            .document(uid)
            .getDocument{snapshot, _ in
                guard let snapshot = snapshot else {return}
                print("DEBUG: Fetched - recentpost Is: \(snapshot)")

                guard let post = try? snapshot.data(as: PostImage.self) else {print("DEBUG returning from post snapshot"); return }
                completion(post)
                print("DEBUG: Fetching post ...")
                print("DEBUG: Most recent post url is: < \(post.postImageUrl) >")
                print("DEBUG: uid is: < \(post.uid) >")
                print("DEBUG: post created on: < \(post.date_uploaded) >")


            }
    }
    
}
