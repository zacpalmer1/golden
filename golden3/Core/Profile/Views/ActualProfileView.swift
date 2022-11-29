//
//  ActualView.swift
//  golden3
//
//  Created by Zac Palmer on 6/14/22.
//

import SwiftUI

struct ActualProfileView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack{
            BackgroundAnimated()
            VStack{
                ProfileView()
                
            }
            
        }
    }
}

struct ActualView_Previews: PreviewProvider {
    static var previews: some View {
        ActualProfileView()
    }
}
