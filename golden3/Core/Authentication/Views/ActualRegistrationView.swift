//
//  ActualRegistrationView.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 11/16/22.
//

import SwiftUI

struct ActualRegistrationView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var viewModel: AuthViewModel
        
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirmation = ""
    @State private var fullname = ""
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundAnimated()
                VStack{
                    Text("Create Your Profile")
                        .font(Font.custom("FredokaOne-Regular", size: 50))
                        .padding(.trailing, 31)
                        .padding(.bottom, 1)
                        .foregroundColor(.white)
                    ZStack{
                        
                        Button{
                            showImagePicker.toggle()
                        } label: {
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .modifier(ProfileImageModifier())
                            } else {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 70, height: 70)
                                //.padding(.trailing, 240)
                                    .padding(.bottom, 0)
                                    .opacity(0.5)
                                Text("Profile Picture")
                                    .font(Font.custom("FredokaOne-Regular", size: 20))
                                //.padding(.leading, 10)
                                    .foregroundColor(.white)
                                Text("+")
                                    .foregroundColor(.white)
                                    .font(Font.custom("FredokaOne-Regular", size: 60))
                                    .padding(.leading, 10)
                                    .padding(.bottom, 11)
                            }
                                
                        
//                        Text("")
//                            .foregroundColor(.white)
//                            .font(Font.custom("FredokaOne-Regular", size: 60))
//                            .padding(.trailing, 240)
//                            .padding(.bottom, 11)
                        
                        //
                        //                        Text("Profile Picture")
                        //                            .font(Font.custom("FredokaOne-Regular", size: 20))
                        //                            .padding(.leading, 10)
                        //                            .foregroundColor(.white)
                        
                    }
                        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedImage: $selectedImage )
                        }
                    
                    }
                    RegistrationCredentialFields(username: $username, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, fullname: $fullname)
                    

                        // viewModel.uploadProfileImage(selectedImage)

                    if let selectedImage = selectedImage {
                        Button(action: {
                            //Sign up user to firebase
                            viewModel.register(withEmail: email,
                                               password: password,
                                               fullname: fullname,
                                               username: username)
                            
                            //if let selectedImage = selectedImage {
                                print("DEBUG: _____________________ IF LET")
                                viewModel.uploadProfileImage(selectedImage)
                            //}
                            
                        }) {
                            ZStack{
                                Rectangle()
                                    .frame(width: 280, height: 60)
                                    .cornerRadius(50)
                                    .foregroundColor(.purple)
                                    .padding(.top, 25)
                                Text("Get Started")
                                    .font(Font.custom("FredokaOne-Regular", size: 20))
                                    .padding(.top, 25)
                                    .foregroundColor(.white)
                            }
                        }
                    }
//                        Button(action: {
//                            //Sign up user to firebase
//                            viewModel.register(withEmail: email,
//                                               password: password,
//                                               fullname: fullname,
//                                               username: username)
//
//                            //if let selectedImage = selectedImage {
//                                print("DEBUG: _____________________ IF LET")
//                                viewModel.uploadProfileImage(selectedImage)
//                            //}
//
//                        }) {
//                            ZStack{
//                                Rectangle()
//                                    .frame(width: 280, height: 60)
//                                    .cornerRadius(50)
//                                    .foregroundColor(.purple)
//                                    .padding(.top, 25)
//                                Text("Get Started")
//                                    .font(Font.custom("FredokaOne-Regular", size: 20))
//                                    .padding(.top, 25)
//                                    .foregroundColor(.white)
//                            }
//                        }
                    
                    
                    HStack{
                        Text("Already have an account?")
                            .font(Font.custom("FredokaOne-Regular", size: 13))
                            .padding(.top, 1)
                            .foregroundColor(.white)
                        //Login button linked to Login Page
                        Button(action: {
                            viewRouter.currentPage = .actualLoginPage
                        }){
                            ZStack{
                                Text("Log in")
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
    
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}
    

struct RegistrationCredentialFields: View{
    
    @Binding var username: String
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordConfirmation: String
    @Binding var fullname: String
    
    var body: some View{
        Group {
            
            // Fields for sign up, can add more (username, name, etc) moving forward but this is the
            // base line->email,pass,passConfirm

            
            // Username
            TextField("Username", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 65)
                .padding(.vertical, 3)
                .font(Font.custom("FredokaOne-Regular", size: 16))
            
            // Full name
            TextField("Fullname", text: $fullname).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 65)
                .padding(.vertical, 3)
                .font(Font.custom("FredokaOne-Regular", size: 16))
            
            // Email
            TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 65)
                .padding(.vertical, 3)
                .font(Font.custom("FredokaOne-Regular", size: 16))
            // Password
            SecureField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 65)
                .padding(.vertical, 3)
                .font(Font.custom("FredokaOne-Regular", size: 16))
            // Confirm Password
            SecureField("Confirm Password", text: $passwordConfirmation).textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.red, width: passwordConfirmation != password ? 1:0)
                .padding(.horizontal, 65)
                .padding(.vertical, 3)
                .font(Font.custom("FredokaOne-Regular", size: 16))
                
        }
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct ActualRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        ActualRegistrationView()
    }
}
