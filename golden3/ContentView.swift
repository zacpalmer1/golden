//
//  ContentView.swift
//  golden3
//
//  Created by Zac Palmer on 6/13/22.
//
// nathan push test
// testestest

import SwiftUI

// this is a test try it
struct ContentView: View {
    var body: some View {
        NavigationView{
            
        ZStack (alignment: .leading){
            MainTabView()
            
        
        .toolbar{
            ToolbarItem(placement: .principal) {
                Image("goldenlogo")
                     .resizable()
                     .frame(width:130, height:45)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    
                } label: {
                    Image("more")
                        .resizable()
                        .frame(width:20, height:20)
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    
                } label: {
                    Image("profilelogo")
                        .resizable()
                        .frame(width:50, height:50)
                }
            
            }
            
        }
        }
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            ContentView()
        }
        
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
