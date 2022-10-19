//
//  ClockView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI

struct ClockView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        Image("clockpage")
            .resizable()
            .ignoresSafeArea()
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
