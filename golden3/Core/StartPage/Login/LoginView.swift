//
//  LoginView.swift
//  golden3
//
//  Created by Zac Palmer on 10/13/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            Text("Create Your Profile")
                .font(Font.custom("FredokaOne-Regular", size: 50))
                .padding(.trailing, 60)
                .padding(.bottom, 10)
            ZStack{
                Button{
                    
                } label: {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 70, height: 70)
                        .padding(.trailing, 270)
                        .padding(.bottom, 0)
                        .opacity(0.7)
                }
                    Text("+")
                        .foregroundColor(.white)
                        .font(Font.custom("FredokaOne-Regular", size: 60))
                        .padding(.trailing, 270)
                        .padding(.bottom, 11)
                
                
                Text("Profile Picture")
                    .font(Font.custom("FredokaOne-Regular", size: 20))
                    .padding(.trailing)
                
            }
            LoginInput()
            ZStack{
                Button{
                    
                } label: {
                    Rectangle()
                        .frame(width: 220, height: 60)
                        .cornerRadius(50)
                        .foregroundColor(.purple)
                        .opacity(0.4)
                        .padding(.top, 20)
                }
                Text("Get Started")
                    .padding(.top, 20)
                    .font(Font.custom("FredokaOne-Regular", size: 20))

            }
            HStack{
                Text("Already have an account?")
                    .font(Font.custom("FredokaOne-Regular", size: 13))
                    .padding(.top)
                Button{
                    
                } label: {
                    Text("Sign In")
                        .font(Font.custom("FredokaOne-Regular", size: 13))
                        .padding(.top)
                        .foregroundColor(.purple)
                }
            }

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
