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
    // private let user: User
    
//    init(user: User) {
//        self.user = user
//    }

    var body: some View {
        
        if let user = authViewModel.currentUser {
            VStack{
                

                HStack(spacing: 12){
                    Spacer()
                    VStack{
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:200, height: 200)
                            .clipShape(Circle())
                            .clipped()
                            .padding(.top)
                        
                        Text(user.fullname)
                            .font(Font.custom("FredokaOne-Regular", size: 25)).padding(.top, 8)
                            .foregroundColor(.black)
                        
                        Text(user.username)
                            .font(Font.custom("FredokaOne-Regular", size: 18))
                            .foregroundColor(.gray)
            
                    }
                    Spacer()
                    Button{
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .bold()
                            .frame(width: 120, height: 32)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 0.75))
                            .padding(.trailing, 10)
                    }
                }
                Spacer()
                Button{
                    authViewModel.signOut()
                } label: {
                    Text("Sign Out").font(.subheadline).bold()
                        .frame(width: 120, height: 32)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 0.75))
                }
                Spacer()
                
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
