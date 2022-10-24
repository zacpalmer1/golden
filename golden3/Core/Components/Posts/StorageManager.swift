//
//  StorageManager.swift
//  golden3
//
//  Created by Laws, Matt (Student) on 10/23/22.
//

import Foundation
import FirebaseStorage

final class StorageManger{
    static let shared = StorageManger()
    private let storage = Storage.storage().reference()
    

    /// Uploads picture to firebase storage an returns completion with url string to download.
    public func uploadProfilePicture(with data: Data, fileName: String, completion: @escaping (Result<String, Error>) -> Void){
        storage.child("images/\(fileName)").putData(data, metadata: nil, completion: {metadata, error in
            guard error == nil else{
                //Failed
                completion(.failure(StorageErrors.failedToUpload))
                return
            }
            self.storage.child("images/\(fileName)").downloadURL(completion: {url, error in
                guard let url = url else{
                    print("Failed to get download URL")
                    completion(.failure(StorageErrors.failedToGetDownloadURL))
                    return
                }
                
                let urlString = url.absoluteString
                print("Download URL returned: \(urlString)")
                completion(.success(urlString))
                
            })
        })
    }
        public enum StorageErrors: Error{
            case failedToUpload
            case failedToGetDownloadURL
    }
}
