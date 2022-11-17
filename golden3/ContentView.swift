//
//  ContentView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//
// nathan push test
// testestest

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    
    var body: some View {
        Group {
            // no user logged in
            if viewModel.userSession == nil {
                GreetingView()
            } else {
                // have a logged in user
                mainInterfaceView
            }
        }
    }
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
        
}

extension ContentView {
    var mainInterfaceView: some View {
        
            NavigationView{
                
            ZStack (alignment: .leading){
                MainTabView()
                
            
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Image("goldenlogo")
                         .resizable()
                         .frame(width:130, height:45)
                         .padding(.trailing, 125)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        
                    } label: {
                        Image("more")
                            .resizable()
                            .frame(width:20, height:20)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        
                    } label: {
                        // Profile image will take the place of Circle
                        // This will display the users profile image
                        if let profileImage = profileImage {
                            profileImage
                        } else {
                            Circle()
                                .fill(.gray)
                                .frame(width:50, height:50)
                                .padding(.top, 55)
                        }
                            
    //                    Circle()
    //                        .fill(.gray)
    //                        .frame(width:50, height:50)
    //                        .padding(.top, 55)
                        
                        // username will be the users unique username
    //                    Text("username")
    //                        .font(Font.custom("FredokaOne-Regular", size: 18))
    //                        .foregroundColor(.black)
    //                        .padding(.top, 85)
                        
//                        Text(mainInstance.name)
//                            .font(Font.custom("FredokaOne-Regular", size: 18))
//                            .foregroundColor(.black)
//                            .padding(.top, 85)
                    }
                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedImage: $selectedImage )
                        
                    }
                    
                
                
                }
                
            }
            }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            ContentView()
            
        }
        
    }
}

//struct Previews_ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
