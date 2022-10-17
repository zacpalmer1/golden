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
    // format:
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
