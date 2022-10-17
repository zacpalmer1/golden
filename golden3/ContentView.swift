//
//  ContentView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//
// nathan push test
// testestest

import SwiftUI
import Firebase

// this is a test try it
struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        Group {
            // no user logged in -> greeting page
            if viewRouter.userSession == nil {
                GreetingView()
                
            } else {
                // have a logged in user
                mainInterfaceView
            }
        }
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
                                Circle()
                                    .fill(.gray)
                                    .frame(width:50, height:50)
                                    .padding(.top, 55)
                                // username will be the users unique username
                                //Text("username")
                                
                                Text(mainInstance.name)
                                    .font(Font.custom("FredokaOne-Regular", size: 18))
                                    .foregroundColor(.black)
                                    .padding(.top, 85)
                            }
                            
                            
                        }
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            if userSession == nil{
//                                ProgressView()
//                            } else {
//
//                                Button("Sign Out")
//                                    ViewRouter().signOutUser()
//                            }
////                            }){
////                                Text("Sign Out")
////                                    .font(Font.custom("FredokaOne-Regular", size: 18))
////                                    .foregroundColor(.black)
////                                    .padding(.top, 85)
////                            }
//                        }
//
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

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
