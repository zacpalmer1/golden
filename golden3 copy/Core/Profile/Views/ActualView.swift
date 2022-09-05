//
//  ActualView.swift
//  golden3
//
//  Created by Zac Palmer on 6/14/22.
//

import SwiftUI

struct ActualView: View {
    var body: some View {
        ZStack{
            Image("dark")
                .resizable()
                .ignoresSafeArea()
            VStack{
                ProfileView()
                
            }
            
        }
    }
}

struct ActualView_Previews: PreviewProvider {
    static var previews: some View {
        ActualView()
    }
}
