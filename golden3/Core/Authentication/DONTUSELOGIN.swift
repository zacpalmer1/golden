//
//  LoginView.swift
//  golden3
//
//  Created by Zac Palmer on 10/13/22.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var authViewModel: AuthViewModel
    // @Published var userSession: FirebaseAuth.User?
//
    //@ObservableObject var userSession: AuthViewModel
//    init() {
//        self.userSession = Auth.auth().currentUser
//    }
    
    //print(authViewModel.userSession)


    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var passwordConfirmation = ""
    
    @State var authProcessing = false
    @State var authProcessingErrorMsg = ""
    
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
                        }
                        
                        Text("")
                            .foregroundColor(.white)
                            .font(Font.custom("FredokaOne-Regular", size: 60))
                            .padding(.trailing, 240)
                            .padding(.bottom, 11)
                        
                        //
//                        Text("Profile Picture")
//                            .font(Font.custom("FredokaOne-Regular", size: 20))
//                            .padding(.leading, 10)
//                            .foregroundColor(.white)
                        
                    }
                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedImage: $selectedImage )
                        
                    }
                    //LoginInput()
                    SignUpCredentialFields(username: $username, email: $email, password: $password, passwordConfirmation: $passwordConfirmation)
                    //Login button linked to Login Page
                    Button(action: {
                        //Sign up user to firebase
                        signUpUser(userEmail: email, userPassword: password, username: username)
                        
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
                    // need to move " get started" button until after firebase has created account
                    // ^ solved. done
                    // feel free to delete below. this is being replaced by a Button(action: ){} to work with ViewRouter
                    
//                    NavigationLink{
//
//                        HowItWorksView()
//                            .navigationBarHidden(true)
//                    } label: {
//                        ZStack{
//                            Rectangle()
//                                .frame(width: 280, height: 60)
//                                .cornerRadius(50)
//                                .foregroundColor(.purple)
//                                .padding(.top, 25)
//                            Text("Get Started")
//                                .font(Font.custom("FredokaOne-Regular", size: 20))
//                                .padding(.top, 25)
//                                .foregroundColor(.white)
//                        }
//                    }
                    
                    
                    // Prevent user from creating account w/o email and password
                    .disabled(!authProcessing && !email.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty && password == passwordConfirmation ? false : true)
                    if authProcessing{
                        ProgressView()
                    }
                    if !authProcessingErrorMsg.isEmpty{
                        Text("Account creation failed: \(authProcessingErrorMsg)")
                    }
                    
                    HStack{
                        Text("Already have an account?")
                            .font(Font.custom("FredokaOne-Regular", size: 13))
                            .padding(.top, 1)
                            .foregroundColor(.white)
                        //Login button linked to Login Page
                        Button(action: {
                            viewRouter.currentPage = .signUpPage
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
    // Adds user to firebase
    func signUpUser(userEmail: String, userPassword: String, username: String){
        authProcessing = true
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) {
            authResult, error in guard error == nil else{
                authProcessingErrorMsg = error!.localizedDescription
                authProcessing = false
                return
            }
            
            
//            guard let user = authResult?.user else { return }
//            self.userSession = user
            
            print("DEBUG: New User created with email: \(userEmail)")
            //var authResult: AuthDataResult
            
            // In the case that Firebase sends "some" result -> continue to howItWorksPage
            switch authResult {
            case .none:
                print("authResult: Could not create account.")
                authProcessing = false
            case .some(_):
                print("authResult: New Account Created with authResult: \(authResult)")
                authProcessing = false
                viewRouter.currentPage = .howItWorksPage
            }
            
            //mainInstance.name = username
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

struct SignUpCredentialFields: View{
    
    @Binding var username: String
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordConfirmation: String
    
    var body: some View{
        Group {
            
            // Fields for sign up, can add more (username, name, etc) moving forward but this is the
            // base line->email,pass,passConfirm
            
//            // First Name
//            TextField("First Name", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.horizontal, 65)
//                .padding(.vertical, 3)
//                .font(Font.custom("FredokaOne-Regular", size: 16))
//            // Last Name
//            TextField("Last Name", text: $lastname).textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.horizontal, 65)
//                .padding(.vertical, 3)
//                .font(Font.custom("FredokaOne-Regular", size: 16))
//            // Username
            TextField("Username", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
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


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
