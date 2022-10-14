//
//  SignupView.swift
//  golden3
//
//  Created by Zac Palmer on 10/13/22.
//

import SwiftUI

struct SignupView: View {
    var body: some View {
        VStack{
            Text("Welcome Back")
                .font(Font.custom("FredokaOne-Regular", size: 60))
                .padding(.trailing, 60)
            ZStack{
                Button{
                    
                } label:{
                    Rectangle()
                        .frame(width:300, height: 70)
                        .cornerRadius(20)
                        .padding(.bottom)
                        .foregroundColor(.white)
                }
                Text("Sign in with Apple")
                    .foregroundColor(.black)
                    .font(Font.custom("FredokaOne-Regular", size: 23))
                    .padding(.bottom)
                    .padding(.leading, 45)

            }
            ZStack{
                Button{
                    
                } label:{
                    Rectangle()
                        .frame(width:300, height: 70)
                        .cornerRadius(20)
                        .padding(.bottom)
                        .foregroundColor(.white)

                }
                Text("Sign in with Google")
                    .foregroundColor(.black)
                    .font(Font.custom("FredokaOne-Regular", size: 23))
                    .padding(.bottom)
                    .padding(.leading, 45)

            }
            SignupInput()
                .padding(.top)
            ZStack{
                Button{
                    
                } label:{
                    Rectangle()
                        .frame(width: 220, height: 60)
                        .cornerRadius(50)
                        .foregroundColor(.purple)
                        .opacity(0.4)
                        .padding(.top, 50)
                }
                Text("Login")
                    .font(Font.custom("FredokaOne-Regular", size: 20))
                    .padding(.top, 50)
            }
            HStack{
                Text("Dont have an account?")
                    .font(Font.custom("FredokaOne-Regular", size: 13))
                    .padding(.top, 20)
                Button{
                    
                } label:{
                    Text("Sign Up")
                        .font(Font.custom("FredokaOne-Regular", size: 13))
                        .padding(.top, 20)
                        .foregroundColor(.purple)
                }
            }
                

        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
