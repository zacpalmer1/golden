//
//  FeedView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI


struct FeedView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var showNewPostView = false
    var body: some View {
        ZStack (alignment: .topTrailing){
            ScrollView{
                LazyVStack(spacing: 40){
                    ForEach(0 ... 10, id: \.self) { _ in
                        PostRowView()
                    }
                }
            }//.background(.orange)
            
//            Button{
//                print("Camera button")
//                viewRouter.currentPage = .cameraPage
//
//            } label: {
//                Image(systemName: "camera.fill")
//                    .resizable()
//                    .renderingMode(.template)
//                    .frame(width: 28, height: 28)
//                    .padding()
//            }
//            .background(Color.black)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .padding()
//            .fullScreenCover(isPresented: $showNewPostView){
//                Text("New Post View")
//            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
