//
//  ContentView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//
// nathan push test
// testestest

import SwiftUI
import Kingfisher


struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    
    var body: some View {
        Group {
            // no user logged in
            if authViewModel.userSession == nil {
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
                    Button{
                        withAnimation(.easeIn){
                            viewRouter.currentPage = .howItWorksPage

                        }
                        //viewRouter.currentPage = .howItWorksPage
                    } label: {
                        Image("goldenlogo")
                             .resizable()
                             .frame(width:130, height:45)
                             //.padding(.trailing, 50)
                    }
//                    Image("goldenlogo")
//                         .resizable()
//                         .frame(width:130, height:45)
//                         .padding(.trailing, 125)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        viewRouter.currentPage = .searchPage
                    } label: {
                        Image("magnifylogo")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.white)
//                        Text("Search")
//                            .font(Font.custom("FredokaOne-Regular", size: 60))
//                            .padding(.trailing, 60)
//                            .foregroundColor(.white)
//                        Image("more")
//                            .resizable()
//                            .frame(width:20, height:20)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    if let user = authViewModel.currentUser {
//                        Button{
//                            //viewRouter.currentPage = .profilePage
//
//                        } label: {
                            KFImage(URL(string: user.profileImageUrl))
                                
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                //.padding(.top, 85)
                                .clipShape(Circle())
                        // username will be the users unique username
                            Text("@\(user.username)")
                                .font(Font.custom("FredokaOne-Regular", size: 18))
                                .foregroundColor(.black)
                                .padding(.top, 85)
                       
                            
                            

                        //}
                        
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
