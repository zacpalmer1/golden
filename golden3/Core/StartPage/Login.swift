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
                TextField("Last Name", text: $lastname).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Username", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Confirm Password", text: $confirmpassword).textFieldStyle(RoundedBorderTextFieldStyle())
                }
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
