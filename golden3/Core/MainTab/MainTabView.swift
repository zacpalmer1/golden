//
//  MainTabView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectIndex = 0
    var body: some View {
        ZStack {
            HStack(alignment: .bottom) {
                
                TabView(selection: $selectIndex){
                    
                    ActualFeed()
                        .onTapGesture {
                            self.selectIndex = 0
                        }
                        .tabItem{
                       // Image("homelogo")
                         //  .resizable()
                         //   .ignoresSafeArea()
                          //  .frame(width: 50, height: 50)
                                
                                
                    }
                    
                        .tag(0)
                    ClockView()
                        .onTapGesture {
                            self.selectIndex = 1
                        }
                        .tabItem{
                        //Image("time")
                           // .resizable()
                           // .frame(width:50, height: 50)
                            
                                
                    }
                    
                        .tag(1)
                    ActualView()
                        .onTapGesture {
                            self.selectIndex = 2
                        }
                        .tabItem{
                       // Image("searchlogo")
                               // .resizable()
                               // .frame(width: 100, height: 100)
                                
                    }
                        .tag(2)
                        .background(Color.gray)
                }
                .onAppear(){
                    UITabBar.appearance().barTintColor = .white
                }
                .background(Color.gray)
                    
            }
            
        }
        
    }
        
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewInterfaceOrientation(.portrait)
    }
}
