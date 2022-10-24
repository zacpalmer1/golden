//
//  CameraView.swift
//  golden3
//
//  Created by Laws, Matt (Student) on 10/24/22.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @StateObject var camera = Camera()
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack{
            CameraPreview(camera: camera)
                .ignoresSafeArea()
            
            VStack{
                if camera.isCameraTaken{
                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera").foregroundColor(.black)
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
                        Button(action: {}, label: {
                            Text("Save")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        })
                        .padding(.leading)
                        Spacer()
                    } else {
                        Button(action: {camera.isCameraTaken.toggle()}, label: {
                            
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

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}


class Camera: ObservableObject{
    @Published var isCameraTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
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
            let device = AVCaptureDevice.default(.builtInDualCamera,for: .video, position: .back)
            
            let input = try AVCaptureDeviceInput(device: device!)
            
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
        // TODO: Take photo.
    }
}

struct CameraPreview: UIViewRepresentable{
    @ObservedObject var camera: Camera
    
    func makeUIView(context: Context) -> UIView {
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
