//
//  GreetingView.swift
//  golden3
//
//  Created by Zac Palmer on 10/14/22.
//
//  This is the first page a user will see after downloading the application
//  Its purpose is to allow the user to either Login or Signup

import SwiftUI

struct GreetingView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
                
        // Allows us to switch between pages
        NavigationView{
            // Place BackgroundAnimated() behind Text and buttons
            ZStack{
                BackgroundAnimated()
                // Verticle Stack for Text: Welcome to golden
                VStack{
                    Text("Welcome to")
                        .font(Font.custom("FredokaOne-Regular", size: 45))
                        .frame(height:50)
                        .foregroundColor(.white)
                        .padding(.top, 60)
                    // Image in place of future animation
                    Image("goldenlogoimg")
                        .resizable()
                        .frame(width: 240, height:80)
                        .padding(.bottom, 250)
                    
                    // Login button linked to Login Page
                    NavigationLink{
                        //SignupView()
                        ActualLoginView()
                        // hides the backspace when changing pages
                            .navigationBarHidden(true)
                    }
                    // The design of the login button
                label: {
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
                    
                    //Sign up button linked to Signin Page
                    NavigationLink{
                        //LoginView()
                        ActualRegistrationView()
                        // hides the backspace when changing pages
                            .navigationBarHidden(true)
                    }
                    // The design of the sign up button
                label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 280, height: 60)
                            .cornerRadius(50)
                            .foregroundColor(.blue)
                            .padding(.top, 15)
                        Text("Sign up")
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

