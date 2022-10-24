//
//  ProfileView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI


struct ProfileView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    //private let database = Database.database().reference()
    var body: some View {
        
        VStack{
            

            HStack(spacing: 12){
                Spacer()
                VStack{
                    Image("profileImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:200, height: 200)
                        .clipShape(Circle())
                        .clipped()
                        .padding(.top)
                    
                    Text("Jimmy").font(Font.custom("FredokaOne-Regular", size: 25)).padding(.top, 8).foregroundColor(.black)
                    
                    Text("@Jimbo").font(Font.custom("FredokaOne-Regular", size: 15))
                        .padding(.top, -15)
                        .foregroundColor(.black)
        
                }
                Spacer()
                Button{
                    
                } label: {
                    Text("Edit Profile").font(.subheadline).bold()
                        .frame(width: 120, height: 32)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                }
            }
            Spacer()
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
