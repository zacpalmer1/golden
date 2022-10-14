//
//  Login.swift
//  golden3
//
//  Created by Zac Palmer on 9/5/22.
//

import SwiftUI

struct LoginInput: View {
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmpassword: String = ""

    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 350, height: 350)
                .cornerRadius(30)
                .foregroundColor(.white)
                .opacity(0.4)
            VStack {
                TextField("First Name", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .padding(.vertical, 5)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                    
                TextField("Last Name", text: $lastname).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .padding(.vertical, 5)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                TextField("Username", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .padding(.vertical, 5)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .padding(.vertical, 5)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                TextField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .padding(.vertical, 5)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                TextField("Confirm Password", text: $confirmpassword).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .padding(.vertical, 5)
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
