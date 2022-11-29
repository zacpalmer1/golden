//
//  ProfileView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var showNewPostView = false
    
    
    
    var body: some View {
        
        
        let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        
        if let user = authViewModel.currentUser{
            ZStack(alignment: .leading){
                Button{
                    viewRouter.currentPage = .contentPage
                } label: {
                   
                        Text("Back")
                            .padding(.bottom, 700)
                            .padding(.leading, 20)
                            .foregroundColor(.black)
                            .font(Font.custom("FredokaOne-Regular", size: 15))
                       
                    
                }
                
            
            VStack{
                
                HStack{
                    
                    
                    
                    
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:80, height: 80)
                        .clipShape(Circle())
                        .clipped()
                    
                    
                    VStack(alignment: .leading){
                        ZStack{
                            Button{
                                viewRouter.currentPage = .settingsPage
                            } label: {
                                
                                Text("Settings")
                                    .foregroundColor(.white)
                                    .font(Font.custom("FredokaOne-Regular", size: 15))
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.black)
                                    .clipShape(Capsule())
                                
                            }
                            
                            
                        }
                        Text(user.username)
                            .font(Font.custom("FredokaOne-Regular", size: 17))
                            .foregroundColor(.white)
                        Text(user.fullname)
                            .font(Font.custom("FredokaOne-Regular", size: 17))
                            .foregroundColor(.gray)
                        
                        
                    }
                    .padding(.top,80)
                    
                    
                    
                    
                    
                }
                Text("Photos")
                    .font(Font.custom("FredokaOne-Regular", size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(.white)
                
                
                ZStack (alignment: .topTrailing){
                    //                    if let post = authViewModel.recentPost {
                    //                        KFImage(URL(string: post.postImageUrl))
                    //                    }
                    ScrollView{
                        LazyVGrid(columns: gridItemLayout, spacing: 20) {
                            ForEach((0...13), id: \.self) {_ in
                                Rectangle()
                                    .frame(width: 110, height: 110)
                                    .cornerRadius(20)
                                    .opacity(0.5)
                                    .foregroundColor(.white)
                            }
                            //                            ForEach((14), id: \.self) {_ in
                            //                                KFImage(URL)
                            //                            }
                            //
                        }
                    }
                    .padding([.leading, .trailing])
                }
            }
        }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
