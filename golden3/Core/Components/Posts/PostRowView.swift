//
//  PostRowView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI

struct PostRowView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        VStack{
            Image("behindpost")
                .resizable()
                .frame(width: 340, height:380)
                .opacity(0.5)
                .overlay(
                
                    VStack(alignment: .center, spacing: -9) {
                       // Image("street")
                           // .resizable()
                           // .ignoresSafeArea()
                           // .frame(width: 334, height:320)
                           // .cornerRadius(25, corners: [.topLeft, .topRight])
                        HStack(spacing: 20){
                            Button{
                                
                            } label: {
                                Text("...")
                                    .font(Font.custom("FredokaOne-Regular", size: 20))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 7)
                            }
                            Button{
                                
                            } label: {
                                Text("comment")
                                    .font(Font.custom("FredokaOne-Regular", size: 15))
                                    .foregroundColor(.white)
                            }
                            
                            Button{
                                
                            } label: {
                                Circle()
                                    .foregroundColor(.gray)
                                    .frame(width:50, height:33)
                                    
                                Text("username")
                                    .font(Font.custom("FredokaOne-Regular", size: 15))
                                    .foregroundColor(.white)
                                
                                    
                                
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
