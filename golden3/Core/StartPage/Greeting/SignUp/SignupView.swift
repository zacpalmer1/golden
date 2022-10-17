//
//  SignupView.swift
//  golden3
//
//  Created by Zac Palmer on 10/13/22.
//

import SwiftUI

struct SignupView: View {
    var body: some View {
        ZStack{
            BackgroundAnimated()
            VStack{
                Text("Welcome Back")
                    .font(Font.custom("FredokaOne-Regular", size: 60))
                    .padding(.trailing, 60)
                    .foregroundColor(.white)
                ZStack{
                    Button{
                        
                    } label:{
                        Rectangle()
                            .frame(width:320, height: 70)
                            .cornerRadius(20)
                            .padding(.bottom)
                            .foregroundColor(.white)
                            .opacity(0.4)
                    }
                    HStack{
                        Image("apple")
                            .resizable()
                            .frame(width:40, height:40)
                            .padding(.bottom)
                            .padding(.trailing, 5)
                        Text("Sign in with Apple")
                            .foregroundColor(.white)
                            .font(Font.custom("FredokaOne-Regular", size: 23))
                            .padding(.bottom)
                            .padding(.leading, 15)
                    }
                    
                }
                ZStack{
                    Button{
                        
                    } label:{
                        Rectangle()
                            .frame(width:320, height: 70)
                            .cornerRadius(20)
                            .padding(.bottom)
                            .foregroundColor(.white)
                            .opacity(0.4)
                        
                    }
                    HStack{
                        Image("google")
                            .resizable()
                            .frame(width: 40, height:40)
                            .padding(.bottom)
                            .padding(.leading, 10)
                        Text("Sign in with Google")
                            .foregroundColor(.white)
                            .font(Font.custom("FredokaOne-Regular", size: 23))
                            .padding(.bottom)
                            .padding(.leading, 15)
                    }
                }
                SignupInput()
                    .padding(.top)
                //Login button linked to Login Page
                NavigationLink{
                    ContentView()
                        .navigationBarHidden(true)
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 280, height: 60)
                            .cornerRadius(50)
                            .foregroundColor(.purple)
                            .padding(.top, 35)
                        Text("Login")
                            .font(Font.custom("FredokaOne-Regular", size: 20))
                            .padding(.top, 35)
                            .foregroundColor(.white)
                    }
                }
                
                HStack{
                    Text("Dont have an account?")
                        .font(Font.custom("FredokaOne-Regular", size: 13))
                        .padding(.top, 1)
                        .foregroundColor(.white)
                    //Login button linked to Login Page
                    NavigationLink{
                        LoginView()
                            .navigationBarHidden(true)
                    } label: {
                        ZStack{
                            Text("Sign Up")
                                .font(Font.custom("FredokaOne-Regular", size: 13))
                                .padding(.top, 1)
                                .foregroundColor(.purple)
                        }
                    }
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
