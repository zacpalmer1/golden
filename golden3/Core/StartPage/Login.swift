//
//  Login.swift
//  golden3
//
//  Created by Zac Palmer on 9/5/22.
//

import SwiftUI

struct Login: View {
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmpassword: String = ""

    var body: some View {
        VStack {
                TextField("First Name", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 35)
                .padding(.vertical, 5)
                TextField("Last Name", text: $lastname).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 35)
                .padding(.vertical, 5)
                TextField("Username", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 35)
                .padding(.vertical, 5)
                TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 35)
                .padding(.vertical, 5)
                TextField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 35)
                .padding(.vertical, 5)
                TextField("Confirm Password", text: $confirmpassword).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 35)
                .padding(.vertical, 5)
                }
        
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
