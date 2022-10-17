//
//  ViewRouter.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 10/17/22.
//

import SwiftUI
// ViewRouter class contains the parameter for which page or "view" is displayed
// the enum page connects to Core/ViewControl.swift as a nav controller


// Instructions for adding new Views/pages
// at the top of each page:
//      @EnvironmentObject var viewRouter: ViewRouter
// add that page to ViewRouter.swift and ViewControl.swift/enum Page in the format shown

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .greetingPage
    
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
