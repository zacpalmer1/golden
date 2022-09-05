//
//  FeedView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI


struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 40){
                ForEach(0 ... 10, id: \.self) { _ in
                    PostRowView()
                    
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
