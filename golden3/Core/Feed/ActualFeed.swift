//
//  ActualFeed.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI

struct ActualFeed: View {
    var body: some View {
        ZStack{
            Image("dark")
                .resizable()
                .ignoresSafeArea()
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
