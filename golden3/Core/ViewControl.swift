//
//  ViewControll.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 10/17/22.
//

import SwiftUI

// ViewControl.swift is the actual navigation switcher

struct ViewControl: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        // Debug statement showing .currentPage prints to console, helps if something crashes to know what view caused the crash
        let _ = print("VIEW_DEBUG: ViewControl initialized showing \(viewRouter.currentPage).")

        switch viewRouter.currentPage{
        case .greetingPage:
            GreetingView()
        case .loginPage:
            LoginView()
        case .signUpPage:
            SignupView()
        case .howItWorksPage:
            HowItWorksView()
        case .contentPage:
            ContentView()
        case .cameraPage:
            CameraView()
    
        case .actualLoginPage:
            ActualLoginView()
        case .actualRegistrationPage:
            ActualRegistrationView()
        case .profilePage:
            ActualProfileView()
        case .searchPage:
            SearchView()
            
            
    // add new page format:
    // case .newPage:
    //      NewView()
        
        }
    
    }
}

struct ViewControl_Previews: PreviewProvider {
    static var previews: some View {
        ViewControl()
    }
}
