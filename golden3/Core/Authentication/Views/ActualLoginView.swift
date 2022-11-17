//
//  ActualLoginView.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 11/16/22.
//

import SwiftUI

struct ActualLoginView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""

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
                
                LoginCredentialFields(email: $email, password: $password)
                
                // Sign in button
                Button(action: {
                    //signInUser(userEmail: email, userPassword: password)
                    viewModel.login(withEmail: email, withPassword: password)
                }) {
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
                    
//                    // Prevent user from creating account w/o email and password
//                    .disabled(!authProcessing && !email.isEmpty && !password.isEmpty  ? false : true)
//                    if authProcessing{
//                        ProgressView()
//                    }
//                    if !authProcessingErrorMsg.isEmpty{
//                        Text("Account creation failed: \(authProcessingErrorMsg)")
//                    }
                    
                HStack{
                    Text("Dont have an account?")
                        .font(Font.custom("FredokaOne-Regular", size: 13))
                        .padding(.top, 1)
                        .foregroundColor(.white)
                    //
                    Button(action: {
                        viewRouter.currentPage = .actualRegistrationPage
                    }){
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

struct LoginCredentialFields: View{
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View{
        Group {
            // Fields for sign up, can add more (username, name, etc) moving forward but this is the
            // base line->email,pass,passConfirm
            
            // Email -> can be changed to username in the future
            TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 65)
                .padding(.vertical, 3)
                .font(Font.custom("FredokaOne-Regular", size: 16))
            // Password
            SecureField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 65)
                .padding(.vertical, 3)
                .font(Font.custom("FredokaOne-Regular", size: 16))
    
        }
    }

}
struct ActualLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ActualLoginView()
    }
}
