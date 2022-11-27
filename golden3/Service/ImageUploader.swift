//
//  ImageUploader.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 11/16/22.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {

        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error: , \(error.localizedDescription)")
            }
            
            ref.downloadURL { imageUrl, error in
                if let error = error {
                    print("DEBUG: Failed to upload image with error: , \(error.localizedDescription)")
                }
                guard let imageUrl = imageUrl?.absoluteString else { return }
                print("DEBUG: Image uploaded at url \(imageUrl)")
                
                completion(imageUrl)
            }
        }
        
    }
}
