//
//  FeedView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct FeedView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var showNewPostView = false
    
    @State var retrievedImages = [UIImage]()
    
    var body: some View {
        ZStack (alignment: .topTrailing){
            ScrollView{
                ForEach(retrievedImages, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                
                LazyVStack(spacing: 40){
                    ForEach(0 ... 0, id: \.self) { _ in  // change back to 0 ... 0
                        PostRowView()
                    }
                }
            }//.background(.orange)
            
            //            Button{
            //                print("Camera button")
            //                viewRouter.currentPage = .cameraPage
            //
            //            } label: {
            //                Image(systemName: "camera.fill")
            //                    .resizable()
            //                    .renderingMode(.template)
            //                    .frame(width: 28, height: 28)
            //                    .padding()
            //            }
            //            .background(Color.black)
            //            .foregroundColor(.white)
            //            .clipShape(Circle())
            //            .padding()
            //            .fullScreenCover(isPresented: $showNewPostView){
            //                Text("New Post View")
            //            }
            .onAppear {
                
                retrievePhotos()
                
            }
        }
    }
    
    func retrievePhotos(){
        let db = Firestore.firestore()
        
        db.collection("posts").getDocuments {snapshot, error in
        
            if error == nil && snapshot != nil{
                
                var paths = [String]()
                
                // loop thru returned documents
                for doc in snapshot!.documents{
                    // extract the file path
                    paths.append(
                        doc["postImageUrl"] as! String
                    )
                    
                }
                
                // loop thru each filepath and fetch data from storage
                for path in paths {
                    
                    // get a reference to storage
                    let storageRef = Storage.storage().reference()
                    
                    // specify path
                    let fileRef = storageRef.child(path)

                    
                    // retrieve data
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        if error == nil && data != nil{
                            // create UIImage
                            if let image = UIImage(data: data!) {
                                
                                DispatchQueue.main.async {
                                    retrievedImages.append(image)
                                    
                                }
                                print("DEBUG: image fetched \(data)")
                            }
                        }
                    }
                    
                }
                
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
