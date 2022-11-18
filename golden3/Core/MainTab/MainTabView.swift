//
//  MainTabView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//
// ----This is the bottom navigation bar----
import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var selectIndex = 0
    
    var body: some View {
        
        ZStack {
            HStack(alignment: .bottom) {
                
                TabView(selection: $selectIndex){
                    
                    ActualFeed()
                        .onTapGesture {
                            self.selectIndex = 0
                        }
                        .tabItem{
//                       Image("homelogo")
//                         .resizable()
//                         .ignoresSafeArea()
//                          .frame(width: 50, height: 50)
                            Text("Home")
                                .font(Font.custom("FredokaOne-Regular", size: 60))
                                .padding(.trailing, 60)
                                .foregroundColor(.white)


                    }
                    
                        .tag(0)
                   
                    CameraView()
                        .onTapGesture {
                            self.selectIndex = 1
                        }
                        .tabItem{
                            Text("Camera")
                                .font(Font.custom("FredokaOne-Regular", size: 60))
                                .padding(.trailing, 60)
                                .foregroundColor(.white)
                        }
                    
//                    Button{
//                        print("Camera button")
//                        viewRouter.currentPage = .cameraPage
//
//                    } label: {
//                        Image(systemName: "camera.fill")
//                            .resizable()
//                            .renderingMode(.template)
//                            .frame(width: 28, height: 28)
//                            .padding()
//                    }
//                    .background(Color.black)
//                    .foregroundColor(.white)
//                    .clipShape(Circle())
//                    .padding()
//                    .fullScreenCover(isPresented: $showNewPostView){
//                        Text("New Post View")
//                    }
//                    SearchView()
//                        .onTapGesture {
//                            self.selectIndex = 1
//                        }.tabItem{
//                            Image("searchlogo")
//                                .resizable()
//                                .frame(width: 100, height: 100)
//                            Text("Search")
//                                .font(Font.custom("FredokaOne-Regular", size: 60))
//                                .padding(.trailing, 60)
//                                .foregroundColor(.white)
//
//                        }
                            
                    ActualProfileView()
                        .onTapGesture {
                            self.selectIndex = 2
                        }
                        .tabItem{
                            
                            Text("Profile")
                                .font(Font.custom("FredokaOne-Regular", size: 60))
                                .padding(.trailing, 60)
                                .foregroundColor(.white)
                    }
                        .tag(2)
                        .background(Color.gray)
                }
                .onAppear(){
                    UITabBar.appearance().barTintColor = .white
                    
                }
                .background(Color.gray)
                    
            }
            
            
        }
        
    }
        
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewInterfaceOrientation(.portrait)
    }
}
