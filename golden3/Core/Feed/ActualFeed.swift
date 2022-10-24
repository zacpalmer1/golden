//
//  ActualFeed.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI



struct ActualFeed: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        //Animated Background
        ZStack{
            BackgroundAnimated()
        
            VStack{
                FeedView()
            }
        }
        
    }
}

struct ActualFeed_Previews: PreviewProvider {
    static var previews: some View {
        ActualFeed()
    }
}
