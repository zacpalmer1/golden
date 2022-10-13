//
//  ActualFeed.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI
//import RiveRuntime


struct ActualFeed: View {
    var body: some View {
        // Animated Background
    //    ZStack{
        //        RiveViewModel(fileName: "please").view()
    //            .ignoresSafeArea(.all)
     //           .blur(radius: 40)
            VStack{
                FeedView()
                
            }
            
      //  }
        
    }
}

struct ActualFeed_Previews: PreviewProvider {
    static var previews: some View {
        ActualFeed()
    }
}
