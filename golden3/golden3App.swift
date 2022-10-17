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
    
    @StateObject var viewRouter = ViewRouter()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            
            ViewControl().environmentObject(viewRouter)
            
            //Feel free to delete below, showing before and after navigation syntax
            //GreetingView()
            
        }
    }
}
