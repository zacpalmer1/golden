//
//  BackgroundAnimated.swift
//  golden3
//
//  Created by Zac Palmer on 10/14/22.
//
//
//  This Page hold our background animation Image
//  Because Swift has a bug anytime you want to Simulate the background image
//      uncomment RiveViewModel on line 17 and add rive.ios in packages
//      A link to rive.ios is gethub to copy into find packages: https://github.com/rive-app/rive-ios.git

import SwiftUI
import RiveRuntime

struct BackgroundAnimated: View {
    var body: some View {
        
        RiveViewModel(fileName: "loopbackground").view()
            .ignoresSafeArea(.all)
            .blur(radius: 40)
        ZStack{
            // Only purpose is to allow program to run while RiveViewModel is not active
        }
        .background(.black)
        
        

    }
}

struct BackgroundAnimated_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAnimated()
    }
}
