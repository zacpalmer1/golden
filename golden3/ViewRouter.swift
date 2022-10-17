//
//  ViewRouter.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 10/17/22.
//

import SwiftUI
import FirebaseAuth

// ViewRouter class contains the parameter for which page or "view" is displayed
// the enum page connects to Core/ViewControl.swift as a nav controller


// Instructions for adding new Views/pages
// at the top of each page:
//      @EnvironmentObject var viewRouter: ViewRouter
// add that page to ViewRouter.swift and ViewControl.swift/enum Page in the format shown
//
// to change views, instead of calling a page like: SomePage() instead do:
//      viewRouter.currentPage = .someDestinationPage
//

class ViewRouter: ObservableObject {
    //@EnvironmentObject var viewModel: AuthViewModel
    
    @Published var currentPage: Page = .greetingPage
    @Published var userSession: FirebaseAuth.User?
    @EnvironmentObject var viewRouter: ViewRouter
    
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is: \(self.userSession)")
        
    }
    func signOutUser(){
        userSession = nil
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            print("DEBUG: user account signing out")
        }catch let signOutError as NSError{
            print("Error signing out: \(signOutError)")
            
        }
        withAnimation {
            viewRouter.currentPage = .greetingPage
        }
    }
    
}


enum Page {
    case greetingPage
    case loginPage
    case signUpPage
    case howItWorksPage
    case contentPage
    // case feedPage
    // case profilePage
    // case clockPage
    //.....
}
