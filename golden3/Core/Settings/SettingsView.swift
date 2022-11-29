//
//  SettingsView.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 11/29/22.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack{
            Button{
                viewRouter.currentPage = .profilePage
            } label: {
                Text("Back")
            }
            Spacer()
            HStack{
                Button{
                    authViewModel.signOut()
                    viewRouter.currentPage = .greetingPage
                } label: {
                    Text("Sign out")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
