//
//  GreetingView.swift
//  golden3
//
//  Created by Zac Palmer on 10/14/22.
//

import SwiftUI

struct GreetingView: View {
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundAnimated()
                VStack{
                    Text("Welcome to")
                        .font(Font.custom("FredokaOne-Regular", size: 53))
                        .frame(height:50)
                        .foregroundColor(.white)
                    Image("goldenlogoimg")
                        .resizable()
                        .frame(width: 210, height:70)
                    
                        .padding(.bottom, 250)
                    
                    //Login button linked to Login Page
                    NavigationLink{
                        SignupView()
                            .navigationBarHidden(true)
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 280, height: 60)
                                .cornerRadius(50)
                                .foregroundColor(.purple)
                                .padding(.top, 15)
                            Text("Login")
                                .font(Font.custom("FredokaOne-Regular", size: 20))
                                .padding(.top, 11)
                                .foregroundColor(.white)
                        }
                    }
                    
                    //Login button linked to Login Page
                    NavigationLink{
                        LoginView()
                            .navigationBarHidden(true)
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 280, height: 60)
                                .cornerRadius(50)
                                .foregroundColor(.blue)
                                .padding(.top, 15)
                            Text("Signup")
                                .font(Font.custom("FredokaOne-Regular", size: 20))
                                .padding(.top, 11)
                                .foregroundColor(.white)
                        }
                    }
                    
                }
            }
            
            }
            
        }
    }

    
    struct GreetingView_Previews: PreviewProvider {
        static var previews: some View {
            GreetingView()
        }
    }

