//
//  Login.swift
//  golden3
//
//  Created by Zac Palmer on 9/5/22.
//
//  Here we create text fields for LoginView

import SwiftUI

struct LoginInput: View {
    // Everytime this page is opened we begin with empty strings for each value
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmpassword: String = ""

    var body: some View {
        // ZStack to place semi-tranparent rectangle behind text fiels
        ZStack{
            Rectangle()
                .frame(width: 320, height: 330)
                .cornerRadius(30)
                .foregroundColor(.white)
                .opacity(0.4)
            // Vertically Stack each text field item
            VStack {
                // Text Fields
                // First Name
                TextField("First Name", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 65)
                    .padding(.vertical, 3)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                // Last Name
                TextField("Last Name", text: $lastname).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 65)
                    .padding(.vertical, 3)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                // Username
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
                TextField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 65)
                    .padding(.vertical, 3)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                // Confirm Password
                TextField("Confirm Password", text: $confirmpassword).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 65)
                    .padding(.vertical, 3)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
            }
        }
        
    }
}

struct LoginInput_Previews: PreviewProvider {
    static var previews: some View {
        LoginInput()
    }
}
