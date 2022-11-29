//
//  HowItWorksView.swift
//  golden3
//
//  Created by Zac Palmer on 10/14/22.
//

import SwiftUI

struct HowItWorksView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        
        ZStack{
            BackgroundAnimated()
            VStack{
                
                Text("Here's How It Works")
                    .font(Font.custom("FredokaOne-Regular", size: 60))
                    .padding(.trailing, 0)
                    .padding(.bottom)
                    .foregroundColor(.white)
                VStack{
                    
                    Text("You can only post during sunset")
                        .font(Font.custom("FredokaOne-Regular", size: 30))
                        .padding(.trailing, 5)
                        .padding(.bottom)
                        .foregroundColor(.white)

                    
                    Text("After the sunset is over, view your friends posts")
                        .font(Font.custom("FredokaOne-Regular", size: 30))
                        .padding(.leading, 62)
                        .padding(.bottom)
                        .padding(.trailing, 70)
                        .foregroundColor(.white)

                    
                    
                    Text("Leave comments and enjoy your sunset")
                        .font(Font.custom("FredokaOne-Regular", size: 30))
                        .padding(.leading, 60)
                        .padding(.bottom)
                        .padding(.trailing, 70)
                        .foregroundColor(.white)

                    
                }
                Button(action: {
                    viewRouter.currentPage = .contentPage
                }){
                    ZStack{
                        Rectangle()
                            .frame(width: 280, height: 60)
                            .cornerRadius(50)
                            .foregroundColor(.purple)
                            .padding(.top, 15)
                        Text("Lets Go")
                            .font(Font.custom("FredokaOne-Regular", size: 20))
                            .padding(.top, 11)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct HowItWorksView_Previews: PreviewProvider {
    static var previews: some View {
        HowItWorksView()
    }
}
