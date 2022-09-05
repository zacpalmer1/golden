//
//  Login.swift
//  golden3
//
//  Created by Zac Palmer on 9/5/22.
//

import SwiftUI

struct Login: View {
    @State private var firstname: String = ""
    var body: some View {
        VStack {
                TextField("First Name", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Last Name", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
            
                TextField("Username", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Password", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Confirm Password", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                }
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
