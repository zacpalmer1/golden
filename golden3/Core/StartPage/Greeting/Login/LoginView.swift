//
//  LoginView.swift
//  golden3
//
//  Created by Zac Palmer on 10/13/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundAnimated()
                VStack{
                    Text("Create Your Profile")
                        .font(Font.custom("FredokaOne-Regular", size: 50))
                        .padding(.trailing, 60)
                        .padding(.bottom, 10)
                        .foregroundColor(.white)
                    ZStack{
                        Button{
                            
                        } label: {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 70, height: 70)
                                .padding(.trailing, 270)
                                .padding(.bottom, 0)
                                .opacity(0.5)
                        }
                        Text("+")
                            .foregroundColor(.white)
                            .font(Font.custom("FredokaOne-Regular", size: 60))
                            .padding(.trailing, 270)
                            .padding(.bottom, 11)
                        
                        
                        Text("Profile Picture")
                            .font(Font.custom("FredokaOne-Regular", size: 20))
                            .padding(.trailing)
                            .foregroundColor(.white)
                        
                    }
                    LoginInput()
                    //Login button linked to Login Page
                    NavigationLink{
                        HowItWorksView()
                            .navigationBarHidden(true)
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 280, height: 60)
                                .cornerRadius(50)
                                .foregroundColor(.purple)
                                .padding(.top, 15)
                            Text("Get Started")
                                .font(Font.custom("FredokaOne-Regular", size: 20))
                                .padding(.top, 11)
                                .foregroundColor(.white)
                        }
                    }
                    
                    HStack{
                        Text("Already have an account?")
                            .font(Font.custom("FredokaOne-Regular", size: 13))
                            .padding(.top)
                            .foregroundColor(.white)
                        //Login button linked to Login Page
                        NavigationLink{
                            SignupView()
                                .navigationBarHidden(true)
                        } label: {
                            
                                Text("Login")
                                    .font(Font.custom("FredokaOne-Regular", size: 13))
                                    .padding(.top, 15)
                                    .foregroundColor(.purple)
                            
                        }
                        
                    }
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
