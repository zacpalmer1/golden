//
//  PostRowView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI

struct PostRowView: View {
    var body: some View {
        VStack{
            Image("behindpost")
                .resizable()
                .frame(width: 340, height:380)
                .opacity(0.5)
                .overlay(
                
                    VStack(alignment: .center, spacing: -9) {
                        Image("street")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 334, height:320)
                            .cornerRadius(25, corners: [.topLeft, .topRight])
                        HStack(spacing: 20){
                            Button{
                                
                            } label: {
                                Image("more")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                            }
                            Button{
                                
                            } label: {
                                Image("comment")
                                    .resizable()
                                    .frame(width:80, height: 50)
                            }
                            
                            Button{
                                
                            } label: {
                                Image("userProfileImage")
                                    .resizable()
                                    .frame(width:120, height:33)
                            }
                              .padding()
                            
                        }
                    }

                    
                    , alignment: .bottom)

        }

    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView()
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
