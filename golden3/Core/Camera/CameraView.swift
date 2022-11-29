//
//  CameraView.swift
//  golden3
//
//  Created by Laws, Matt (Student) on 10/24/22.
//

import SwiftUI
import Firebase
import AVFoundation

struct CameraView: View{
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @StateObject var camera = Camera()
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State private var showImagePicker = false
    
    @State private var photoIsSelected = false
    
    var body: some View {
        
        let user = authViewModel.currentUser
        
        if user != nil {

                    ZStack{

                        CameraPreview(camera: camera)
                            .ignoresSafeArea()
                        
                        VStack{
                            if camera.isCameraTaken{
                                HStack {
                                    Spacer()
                                    Button(action: camera.reTake, label: {
                                        Image("redo").foregroundColor(.white)
                                            .padding()
                                            .background(Color.white)
                                            .clipShape(Circle())
                                    })
                                    .padding(.trailing)
                                }
                            }
                            Spacer()
                            HStack{
                                // Camera button
                                if camera.isCameraTaken{
                                    // Save button
                                    // TODO: Instead of a save button, have it automatically upload to database and post.
                                    
                                    Button(action: {if !camera.isSaved{camera.savePicture()}}, label: {
                                        Text(camera.isSaved ? "Saved" : "Save")
                                            .foregroundColor(.black)
                                            .fontWeight(.semibold)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 20)
                                            .background(Color.white)
                                            .clipShape(Capsule())
                                            .font(Font.custom("FredokaOne-Regular", size: 20))
                                    })
                                    .padding(.leading)
                                    Spacer()
                                    
                                    if camera.isSaved == true && photoIsSelected == false {
                                        Button{
                                            showImagePicker.toggle()
                                            print("DEBUG: toggle")
                                            
//                                            if let selectedImage = selectedImage {
//                                                print("DEBUG: select")
//                                                if postImage != nil {
//                                                    authViewModel.uploadPostImage(selectedImage)
//                                                    print("DEBUG: HERERHERE")
//                                                }
//                                            }
                                            
                                            
                                            
                                            
                                        } label: {
                                            Text("Make A Post")
                                                .foregroundColor(.black)
                                                .fontWeight(.semibold)
                                                .padding(.vertical, 10)
                                                .padding(.horizontal, 20)
                                                .background(Color.white)
                                                .clipShape(Capsule())
                                                .font(Font.custom("FredokaOne-Regular", size: 20))
                                        }
                                        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                                            ImagePicker(selectedImage: $selectedImage)
                                        }
                                    }
                                    
                                    if camera.isSaved == true && photoIsSelected == true {
                                        if let selectedImage = selectedImage{
                                            Button{
                                                authViewModel.uploadPostImage(selectedImage)
                                                
                                            } label: {
                                                Text("Post")
                                                    .foregroundColor(.black)
                                                    .fontWeight(.semibold)
                                                    .padding(.vertical, 10)
                                                    .padding(.horizontal, 20)
                                                    .background(Color.white)
                                                    .clipShape(Capsule())
                                                    .font(Font.custom("FredokaOne-Regular", size: 20))
                                            }
                                        }
                                        
                                    }
                                } else {
                                    Button(action: camera.takePicture, label: {
                                        
                                        // Zstack for the circles to stack.
                                        ZStack{
                                            // Camera button circle.
                                            Circle()
                                                .fill(Color.white)
                                                .frame(width: 65, height: 65)
                                            Circle()
                                                .stroke(Color.white, lineWidth: 2)
                                                .frame(width: 75, height: 75)
                                            
                                        }
                                    })
                                }
                            }.frame(height: 75)
                        }
                    }
                    .onAppear(perform: {
                        camera.checkCameraAuthorization()
                    })
        }
        
 
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
        print("DEBUG: loaded image\(postImage)")
        photoIsSelected = true
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}


class Camera: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    @Published var isCameraTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var currentCamera: AVCaptureDevice?
    @Published var isSaved = false
    @Published var pictureData = Data(count: 0)
    
    //@EnvironmentObject var authViewModel: AuthViewModel
    
    
    func checkCameraAuthorization(){
        // Checks if camera has permissions.
        // TODO: See if specific user gave permissions (?)
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .authorized:
            setUpCamera()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status{
                    self.setUpCamera()
                }
            }
            return
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    func setUpCamera(){
        do{
            self.session.beginConfiguration()
            // guard let device = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: AVMediaType.video, position: .back)
            
            guard let device = AVCaptureDevice.default(.builtInWideAngleCamera,for: .video, position: .back)
                    
            else {
                print("Error loading camera.")
                
                return
            }
            self.currentCamera = device
            let input = try AVCaptureDeviceInput(device: currentCamera!)
            
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func takePicture(){
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
          
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                withAnimation{self.isCameraTaken.toggle()}
                self.session.stopRunning()
            }
            
        }
        print("DEBUG: Picture Taken")
        
    }
    //TODO: Retake Photo
    func reTake(){
        print("DEBUG: Retake pressed")
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation{self.isCameraTaken.toggle()}
                self.isSaved = false
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil{
            //print("DEBUG: \(error)");
            return
        }
        
        print("DEBUG: Picture taken")
        
        guard let imageData = photo.fileDataRepresentation() else { return }
        
        self.pictureData = imageData
        //print("DEBUG: IMAGE DATA: \(self.pictureData)")
        
    }
    
    func savePicture(){
        
        let image = UIImage(data: self.pictureData)!
        
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.isSaved = true
        print("DEBUG: Photo saved")
        
    }
    
//    func uploadPost(){
//        // @EnvironmentObject var authViewModel: AuthViewModel
//        //  if let user = authViewModel.currentUser {
//        print("DEBUG: upload func user \(user.username)")
//    }
//    print("DEBUG: upload post function")
//
//    let image = UIImage(data: self.pictureData)!
//    print("DEBUG: data->uiimage \(image)")
//    // let user = authViewModel.currentUser //--
//
//    if let user = authViewModel.currentUser {
//        //guard let username = user.username else { print("DEBUG: username returning"); return }
//        let username = user.username
//
//        ImageUploader.uploadPostImageUrl( image: image) { postImageUrl in
//            Firestore.firestore().collection("posts")
//                .document(username)
//                .setData(["postImageUrl": postImageUrl ]) { error in
//                    if let error = error {
//                        print("\(error.localizedDescription)")
//                        return
//                    }
//
//                }
//
//            self.isSaved = true
//
//            }
//        }
//    }
        
//
//        //UIImageWriteToSavedPhotosAlbum(<#T##image: UIImage##UIImage#>, <#T##completionTarget: Any?##Any?#>, <#T##completionSelector: Selector?##Selector?#>, <#T##contextInfo: UnsafeMutableRawPointer?##UnsafeMutableRawPointer?#>)
//
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//        self.isSaved = true
        
        

        
        
    
    
}

struct CameraPreview: UIViewRepresentable{
    @ObservedObject var camera: Camera
    
    func makeUIView(context: Context) -> UIView {
        
        print("DEBUG: CAMERA VIEW")
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        camera.session.startRunning()
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}


//                                        action:
//
//
//                                            {if !camera.isSaved{camera.savePicture()}}
//
//                                            // guard let photoTaken = UIImage(data: Camera.pictureData) else {print("DEBUG: phototaken returning"); return }
////
////
//                                            //camera.uploadPost()
//                                            print("DEBUG: AFTER")
//
//                                        , label: {
                                           


//
////        Button{
////            withAnimation(){
////                viewRouter.currentPage = .contentPage
////
////            }
////
////        } label: {
////            Image("back")
////                 .resizable()
////                 .frame(width:20, height:20)
////                 .padding(.trailing, 300)
////        }
//        ZStack{
////            Button{
////                withAnimation(){
////                    viewRouter.currentPage = .contentPage
////
////                }
////
////            } label: {
////                Image("back")
////                     .resizable()
////                     .frame(width:20, height:20)
////                     .padding(.trailing, 300)
////            }
//            CameraPreview(camera: camera)
//                .ignoresSafeArea()
//
//            VStack{
//                if camera.isCameraTaken{
//                    HStack {
//                        Spacer()
//                        Button(action: camera.reTake, label: {
//                            Image(systemName: "arrow.triangle.2.circlepath.camera").foregroundColor(.black)
//                                .padding()
//                                .background(Color.white)
//                                .clipShape(Circle())
//                        })
//                        .padding(.trailing)
//                    }
//                }
//                Spacer()
//                HStack{
//                    // Camera button
//                    if camera.isCameraTaken{
//                        // Save button
//                        // TODO: Instead of a save button, have it automatically upload to database and post.
//                        Button(action: {if !camera.isSaved{camera.savePicture()}}, label: {
//                                Text(camera.isSaved ? "Saved" : "Save")
//                                // change text
//                                    .foregroundColor(.black)
//                                    .fontWeight(.semibold)
//                                    .padding(.vertical, 10)
//                                    .padding(.horizontal, 20)
//                                    .background(Color.white)
//                                    .clipShape(Capsule())
//                        })
//                        .padding(.leading)
//                        Spacer()
//                    } else {
//                        Button(action: camera.takePicture, label: {
//
//                            // Zstack for the circles to stack.
//                            ZStack{
//                                // Camera button circle.
//                                Circle()
//                                    .fill(Color.white)
//                                    .frame(width: 65, height: 65)
//                                Circle()
//                                    .stroke(Color.white, lineWidth: 2)
//                                    .frame(width: 75, height: 75)
//
//                            }
//                        })
//                    }
//                }.frame(height: 75)
//            }
//        }
//        .onAppear(perform: {
//            camera.checkCameraAuthorization()
//        })
