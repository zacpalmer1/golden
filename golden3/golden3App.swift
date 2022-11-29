//
//  golden3App.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI
import Firebase

@main
struct golden3App: App {
    //@Published var userSession: FirebaseAuth.User?
    @StateObject var viewRouter = ViewRouter()
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
        //self.userSession = Auth.auth().currentUser
    }
    var body: some Scene {
        let _ = print("APP_DEBUG: Application running.")
        WindowGroup {
            
            ViewControl()
                .environmentObject(viewRouter)
                .environmentObject(viewModel)
        }
    }
}
