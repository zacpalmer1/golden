//
//  ProfileView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            HStack{
                Image("userProfileImage")
                    .resizable()
                   // .ignoresSafeArea()
                    .frame(width:270, height: 70)
            }
            Spacer()
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
