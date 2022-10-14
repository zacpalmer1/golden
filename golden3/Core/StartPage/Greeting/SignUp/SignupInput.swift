//
//  SignupInput.swift
//  golden3
//
//  Created by Zac Palmer on 10/13/22.
//

import SwiftUI

struct SignupInput: View {
    
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 380, height: 160)
                .cornerRadius(25)
                .foregroundColor(.white)
                .opacity(0.4)
            VStack {
                
                TextField("Username", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .padding(.vertical, 5)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                    .padding(.top, 15)
                TextField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .padding(.vertical, 5)
                    .font(Font.custom("FredokaOne-Regular", size: 16))
                Button{
                    
                } label: {
                    Text("Forgot Password?")
                        .font(Font.custom("FredokaOne-Regular", size: 10))
                        .padding(.leading, 200)
                        .foregroundColor(.white)
                    
                }
            }
        }
        
    }
}

struct SignupInput_Previews: PreviewProvider {
    static var previews: some View {
        SignupInput()
    }
}
